CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_CreateProposal`(
	IN in_member_id int, 
		in_title varchar(120), 
        in_content TEXT, 
        in_goal int, 
        in_category_id int,
	OUT affected_row_num int
)
BEGIN
	ALTER TABLE db_109403009.tblProposal AUTO_INCREMENT = 1;
    ALTER TABLE db_109403009.tblProposalMember AUTO_INCREMENT = 1;

	INSERT INTO tblProposal (category_id, Title_tblProposal, Content_tblProposal, Goal_tblProposal, Amount_tblProposal, Status_tblProposal, ViewedNum_tblProposal,CreateDate_tblProposal, DueDate_tblProposal, IsDeactivated_tblProposal)
	VALUES (in_category_id, in_title, in_content, in_goal, 0, 2, 0, CURDATE(), DATE_ADD(CreateDate_tblProposal, INTERVAL 90 DAY), 0);
    
	INSERT INTO tblProposalMember (member_id)
	VALUES (in_member_id);
    
    UPDATE tblProposalMember
	SET proposal_id=(SELECT id_tblProposal
						FROM tblProposal
						WHERE tblProposal.Title_tblProposal=in_title)
	WHERE id_tblProposalMember = LAST_INSERT_ID() ;
    
	SELECT ROW_COUNT()
    INTO affected_row_num;
    
    select tblProposal.id_tblProposal as proposal_id,
			tblProposal.Title_tblProposal as proposal_title,
            tblProposal.Content_tblProposal as proposal_content,
            tblProposal.Amount_tblProposal as amount,
            tblProposal.Goal_tblProposal as goal,
            tblProposal.Status_tblProposal as status,
            tblProposal.ViewedNum_tblProposal as viewed_num,
            tblProposal.CreateDate_tblProposal as create_date,
            tblProposal.DueDate_tblProposal as due_date,
            tblCategory.CategoryName_tblCategory as category
	from tblProposal
    join tblCategory
    on tblProposal.category_id = tblCategory.id_tblCategory
    ORDER BY tblProposal.id_tblProposal DESC LIMIT 0 , 1;
END