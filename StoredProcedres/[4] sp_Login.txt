CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_Login`(
	IN in_email varchar(64), 
		in_hashedpwd varchar(200),
	OUT status_code int
)
BEGIN
	SELECT CASE
      WHEN tblMember.Email_tblMember = in_email and tblMemberCredential.HashedPwdString_tblMemberCredential = in_hashedpwd THEN 1
	  WHEN tblMember.Email_tblMember = in_email and tblMemberCredential.HashedPwdString_tblMemberCredential != in_hashedpwd THEN 2
	END AS Answer
    INTO status_code
	from tblMember
	join tblMemberCredential
	on tblMember.id_tblMember = tblMemberCredential.id_tblMemberCredential
    WHERE tblMember.Email_tblMember = in_email;
        
    select case
		when status_code = 1 then 1
        when status_code = 2 then 2
		else 3
        END AS Login
        INTO status_code;
        
	select status_code as Login;
    

END