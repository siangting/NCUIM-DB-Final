CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_UpdatePwd`(
	IN in_member_id int, 
		in_hashedPwd varchar(200), 
        in_salt char(64),
	OUT affected_row_num INT
)
BEGIN
	UPDATE tblMemberCredential
	SET HashedPwdString_tblMemberCredential = in_hashedPwd
	WHERE id_tblMemberCredential = in_member_id;
    
    SELECT ROW_COUNT()
    INTO affected_row_num;
    
    UPDATE tblMember
	SET Salt_tblMember = in_salt
	WHERE id_tblMember = in_member_id;
    
	select tblMember.id_tblMember as member_id, 
			tblMember.Name_tblMember as name, 
            tblMember.Email_tblMember as email,
            tblMemberCredential.HashedPwdString_tblMemberCredential as password ,
            tblMember.Salt_tblMember as salt,
            tblMember.Phone_tblMember as phone,
            tblMember.Address_tblMember as address
    from tblMember
	join tblMemberCredential
	on tblMember.id_tblMember = tblMemberCredential.id_tblMemberCredential    
    WHERE tblMember.id_tblMember = in_member_id;
    
END