CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN in_ratio float,
    OUT result int
)
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS ProposalByCompletionRate AS
	(
	   SELECT 
		  id_tblProposal as proposal_id,
			Title_tblProposal as proposal_title,
            Amount_tblProposal as amount,
            Goal_tblProposal as goal,
			Amount_tblProposal / Goal_tblProposal as ratio
	   FROM tblProposal
	);

	select * 
	from ProposalByCompletionRate
    where ratio >= in_ratio
    ORDER BY ratio DESC;
    
	SELECT found_rows() 
    INTO result;
END