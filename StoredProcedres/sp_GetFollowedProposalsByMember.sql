CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN in_member_id int,
    OUT result_rows INT
)
BEGIN
	
	select tblFollowingRecord.member_id as member_id, 
			Title_tblProposal as proposal_title, 
			Amount_tblProposal as proposal_amount, 
            Goal_tblProposal as proposal_goal
    from tblProposal
	left join tblFollowingRecord 
	on tblProposal.id_tblProposal=tblFollowingRecord.proposal_id
	where tblFollowingRecord.member_id=in_member_id;
    
    select found_rows() 
    into result_rows;

END