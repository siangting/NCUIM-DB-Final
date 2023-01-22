CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_RegisterMember`(
	IN in_email varchar(64), 
		in_hashedPwd varchar(200), 
		in_salt char(64), 
		in_name varchar(64), 
		in_address varchar(255), 
		in_phone varchar(64),
	OUT affected_row_num INT
)
BEGIN
	ALTER TABLE db_109403009.tblMember AUTO_INCREMENT = 1;
    ALTER TABLE db_109403009.tblMemberCredential AUTO_INCREMENT = 1;

	INSERT INTO tblMember (Email_tblMember, Salt_tblMember, Name_tblMember, Address_tblMember, Phone_tblMember) 
    VALUES (in_email, in_salt, in_name, in_address, in_phone);
    
    INSERT INTO tblMemberCredential (HashedPwdString_tblMemberCredential)
	VALUES (in_hashedPwd);    
    
	SELECT ROW_COUNT()
    INTO affected_row_num;
    
    SET SQL_SAFE_UPDATES=0;
    
    UPDATE  tblMemberCredential
	SET     HashedUserId_tblMemberCredential = (select id_tblMember
												from tblMember
                                                where tblMember.Email_tblMember = in_email)
	WHERE HashedPwdString_tblMemberCredential = in_hashedPwd;
    
    SET SQL_SAFE_UPDATES=1;
    
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
    ORDER BY member_id DESC LIMIT 0 , 1;
    
END