"""
NTCSS Legacy API Module
"""
import ctypes
import ctypes.util
import logging
import os
import re


logger = logging.getLogger('ntcss-logger')

# initialize the interface to the 'c' library
libc = ctypes.CDLL(ctypes.util.find_library('c'))

# set the argument types for the c 'free' function
libc.free.restypes = None
libc.free.argtypes = [ctypes.c_void_p]

# create new "type" for returned char pointers
CHAR_POINTER = ctypes.POINTER(ctypes.c_char)

def _get_ntcss_so():
    """
    This function will lazy initialize a ctypes CDLL instance of the
    libntcss.so and return it to the user. If the library has already been
    initialized the previously instance will be returned to the user. The lazy
    initialization is performed to allow the user to change the location of the
    shared object as needed (e.g. during unit tests).
    """

    # lazy initialize the shared library instance
    if _get_ntcss_so._library is None:

        # if the _auto_locate_library is set to True, use the ctypes functions
        # to cleanly find it on the loader path
        if _get_ntcss_so._auto_locate_library:

            # log the location of the shared library being loaded
            logger.debug("Loading the shared library '{0}' from the library "
                "loader path".format(_get_ntcss_so._library_name))

            # initialize the interface to the ntcss library
            shared_library = ctypes.CDLL(ctypes.util.find_library(
                _get_ntcss_so._library_name))

        # otherwise load the library from the specified path
        else:

            # log the location of the shared library being loaded
            logger.debug("Loading the shared library '{0}' from the "
                "specified path".format(_get_ntcss_so._library_path))

            # initialize the interface to the ntcss library
            shared_library = ctypes.CDLL(_get_ntcss_so._library_path)

        # specify the result types of the genpasswd function
        shared_library.genpasswd.restype = ctypes.c_char_p

        # set the return type and parameter types for the setGlob_ic function
        # void setGlob_ic (int ic);
        shared_library.setGlob_ic.restype = None
        shared_library.setGlob_ic.argtypes = [ctypes.c_int]

        # set the return type and parameter types for the triple_des_encrypt
        # function
        # char *triple_des_encrypt(const char *salt,
        #                          const char *text);
        shared_library.triple_des_encrypt.restype = CHAR_POINTER
        shared_library.triple_des_encrypt.argtypes = [ctypes.c_char_p,
            ctypes.c_char_p]

        # set the return type and parameter types for the triple_des_decrypt
        # function
        # char *triple_des_decrypt(const char *salt,
        #                          const char *encrypted_text);
        shared_library.triple_des_decrypt.restype = CHAR_POINTER
        shared_library.triple_des_decrypt.argtypes = [ctypes.c_char_p,
            ctypes.c_char_p]

        # store the shared library
        _get_ntcss_so._library = shared_library

    # return the defined shared library instance
    return _get_ntcss_so._library

# set the defaults for the shared object initialization
_get_ntcss_so._library = None

# this variable determines if the shared object should be located automatically
# based on the library name, otherwise it will load it based on it's path
_get_ntcss_so._auto_locate_library = True

# set the name of the library to be searched for
_get_ntcss_so._library_name = 'ntcss'

# set the default path to None
_get_ntcss_so._library_path = None

# define the shared secret for encryption
SHARED_SECRET='D8B3744D-E60D-4c1d-AB7E-9BA25CD0'

def genpasswd():
    """
    This function wraps the 'genpasswd' function exposed in the NtcssApi.

    The 'genpasswd' function prototype in the C code is:

        char* genpasswd(int *psize)

    The 'psize' parameter passed in was used to specify the length of the
    password that would be generated. In the Eagle baseline it appears that
    Mike Olson and / or Bob Konu made modifications to make the 'psize'
    parameter irrelevant. In other releases (e.g. Patriot or Patriot Dap 4) the
    'psize' value is relevant.

    With the older implementations of the 'genpasswd' function passing in a
    'psize' of 16 would get you a password with a length of 12-16 chars and the
    other complexity requirements may not be met.

    As of the 3.40 release, the password generation has been fixed to properly
    return a password that meets complexity requirements. Validation of the
    password in the python api is unnecessary, and actually buggy.
    The duplicated validation has been removed.
    """

    # recreate the passed in psize variable since this could be modified
    # in the api function call
    psize = ctypes.c_int(15)

    # generate the password
    return _get_ntcss_so().genpasswd(ctypes.byref(psize))


def setGlob_ic(iteration_counter=10000):
    """
    This function wraps the 'setGlob_ic' function exposed in the NtcssApi.

    The 'setGlob_ic' function prototype in the C code is:

        void setGlob_ic (int ic)

    This is used to set the iteration counter for the symmetric key generation
    used for encryption and decryption.
    """

    # call the api function and set the global iteration counter
    _get_ntcss_so().setGlob_ic(iteration_counter)

    # log that we changed the global iteration counter
    logger.debug('The setGlob_ic function call set the iteration counter '
        'to {0}'.format(iteration_counter))


def triple_des_encrypt(salt, text):
    """
    This function wraps the 'triple_des_encrypt' function exposed in the
    NtcssApi.

    The 'triple_des_encrypt' function prototype in the C code is:

        char *triple_des_encrypt(const char *salt, const char *text)

    This function uses OpenSSL triple des encryption to encrypt the specified
    text, and then base64 encodes the encrypted buffer. This function will
    either return the encrypted and encoded text, or it will return None
    if there was a failure.
    """

    # call the encryption function
    _pointer = _get_ntcss_so().triple_des_encrypt(salt, text)

    # guard against triple_des_encrypt returning NULL
    if _pointer is None:
        logger.warn("The triple_des_encrypt function returned NULL")
        return None

    # convert the pointer to a native python string
    encrypted_text = ctypes.string_at(_pointer)

    # free the string returned by triple_des_encrypt
    libc.free(_pointer)

    # log the encryption failure
    if not encrypted_text:
        logger.warn("The triple_des_encrypt function returned an empty string")
        return None

    # return the encrypted text
    return encrypted_text


def triple_des_decrypt(salt, encrypted_text):
    """
    This function wraps the 'triple_des_decrypt' function exposed in the
    NtcssApi.

    The 'triple_des_encrypt' function prototype in the C code is:

        char *triple_des_decrypt(const char *salt, const char *encrypted_text)

    This function uses OpenSSL to base64 decode the encrypted password and then
    use triple des decryption to decrypt encrypted block. This function will
    either return the decrypted and decoded text, or it will return None
    if there was a failure.
    """

    # call the decryption function
    _pointer = _get_ntcss_so().triple_des_decrypt(salt,
        encrypted_text)

    # guard against triple_des_decrypt returning NULL
    if _pointer is None:
        logger.warn("The triple_des_decrypt function returned NULL")
        return None

    # convert the pointer to a native python string
    decrypted_text = ctypes.string_at(_pointer)

    # free the string returned by triple_des_decrypt
    libc.free(_pointer)

    # log the decryption failure
    if not decrypted_text:
        logger.warn("The triple_des_decrypt function returned an empty string")
        return None

    # return the decrypted text
    return decrypted_text