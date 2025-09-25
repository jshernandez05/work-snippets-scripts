# Recovering Root Password
This guide will walk you through recoverying the root password on RHEL 8+.

## 1. Enter boot console
a. At the grub menu, use the arrow key to interupt the boot process.

b. Ensure you highlight the correct OS.

(Insert grub pic)

c. Enter `'e'` to edit the boot commands.

## 2. Edit Boot Commands
a. Use your arrow keys to move down to the line that begins with `linux ($root).....`

b. Press `[Cntrl] + [e]` to move to the end of the line.

(insert grub2 pic)

c. Enter the following:  `rd.break enforcing=0`
> **Note - `rd.break` ensures we stop the boot process before we get to initializing the ram disk.**

> **Note - `enforcing=0` puts SELinux into permissive mode**

d. Press `[Cntrl] + [x]` to continue the boot process

(insert grub3 pic)

## 3. Mount Root File System and Change Password
a. Enter the following to mount file system:
```shell
mount -o remount,rw /sysroot
```
b. Switch to roo filesystem:
```shell
chroot /sysroot
```

> **Note - The shell prompt should now show `sh-x.x#`**

### Change Root Password
a. Enter the following to update/change the root password:
```shell
passwd
```

b. Enter the new password twice.

(insert chroot)

## 4. Return Root File System to Read-Only
a. Return to RAM disk and set root file system back to read only by typing the following:
```shell
exit
```
> **Note - You should now be back at the `switch_root:/#` prompt.**

```shell
mount -o remount,ro /sysroot
```
b. Type `exit` to now continue the boot process.

## 5. Restore Shadow File Context and Set SELinux
> **Note - The current SELinux context of the `/etc/shadow` file is incorrect**

a. Run the following command to set `/etc/shadow` context:
```shell
restorecon -v /etc/shadow
```
> **Note - The context changes from `unlabeled_t` to `shadow_t`**

b. Set SELinux back to enforcing:

- The current SELinux enforcement is `Permissive`:
  ```shell
  getenforce
  ```
- Enter the following to set it back to `Enforcing`:
  ```shell
  setenforce 1
  ```
- Verify:
  ```shell
  getenforce
  ```








