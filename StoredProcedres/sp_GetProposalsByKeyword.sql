CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetProposalsByKeyword`(
	IN in_keyword varchar(64),
    OUT result_rows int
)
BEGIN
	SELECT id_tblProposal as proposal_id,
			Title_tblProposal as proposal_title,
			DueDate_tblProposal as due_date,
			Amount_tblProposal as amount
	FROM tblProposal
	WHERE Title_tblProposal LIKE Concat('%',in_keyword,'%');

	SELECT found_rows() 
    INTO result_rows;
END