CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN in_member_id int,
    OUT result_rows int
    )
BEGIN
	SELECT 
		tblSponsorRecord.member_id AS member_id,
		tblProposal.id_tblProposal AS proposal_id,
		tblProposal.Title_tblProposal AS proposal_title,
		tblProposalOption.Title_tblProposalOption AS proposal_option_title,
		tblSponsorRecord.Amount_tblSponsorRecord AS amount,
		tblProposal.Status_tblProposal AS status
    FROM tblSponsorRecord
    JOIN tblProposalOption
    ON tblSponsorRecord.proposal_option_id = tblProposalOption.id_tblProposalOption
    JOIN tblProposal
    ON tblProposalOption.proposal_id = tblProposal.id_tblProposal
    WHERE tblSponsorRecord.Member_id = in_member_id
    ORDER BY tblProposal.id_tblProposal;
    
    SELECT found_rows() 
    INTO result_rows;
END