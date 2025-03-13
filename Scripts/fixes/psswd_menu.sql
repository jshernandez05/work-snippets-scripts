/****************/
/*   STEP 1     */
/****************/

	/* - ***** You must establish a custom menu first if one doesn't already exist******
	   - Identify what custum menu settings are currently set for logon
	   - Pay attention to the sequence numbers used
	   - If logon doesn't have any custom menus established, the results will be blank  */


select logon, role_name, seq_nbr, muc.menu_level, text, window, type_of_menu, site_authority 
from menu_user_custom muc 
	join menu_structure ms ON muc.menu_level LIKE ms.menu_level
where logon like 'hernanjs'
go


logon		role_name		seq_nbr		menu_level		text			window		type_of_menu	site_authority
hernanjs	"SAA"		1		07.01.01.00 	Stock Items		w_query_stock_queries	M		X

/****************/
/*   STEP 2     */
/****************/

	/*- Insert menu_level "01.07.11.03" (Find Password) to logon
	  - Once inserted, user will be able to access Find Password menu via RSupply Application
	  - Use seq_nbr greater than 5 (application allows for adding 5 custom links; using 6 or 
	    greater will allow more than 5 quick links in the application	  
	    *****This menu grants access to passwords for all UICs*****/

-- insert into menu_user_custom
(logon, role_name, seq_nbr, menu_level)
values
("hernanjs", "SAA", 8, "01.07.11.03")
("hernanjs", "SAA", 9, "03.01.06.00")
go


select logon, role_name, seq_nbr, muc.menu_level, text, window, type_of_menu, site_authority 
from menu_user_custom muc 
	join menu_structure ms ON muc.menu_level like ms.menu_level
where logon like 'hernanjs'
go


logon		role_name		seq_nbr		menu_level		text			window		type_of_menu	site_authority
hernanjs	SAA			1		07.01.01.00 	Stock Items		w_query_stock_queries	M		X
hernanjs	SAA			6		03.01.06.00 	Users Access		w_maint_access		M		U
hernanjs	SAA			7		01.07.04.01 	Batch File Transfer	w_maint_file_xfer	M		X
hernanjs	SAA			8		01.07.11.03 	Find Password		w_find_password		M		D

