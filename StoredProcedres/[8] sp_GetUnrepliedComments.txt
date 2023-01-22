CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetUnrepliedComments`(
	IN in_member_id int,
    OUT result int
)
BEGIN
	select tblProposalMember.member_id as member_id,
			tblComment.proposal_id as proposal_id,
            tblProposal.Title_tblProposal as proposal_title,
            tblComment.id_tblComment as comment_id,
            tblComment.UserComment_tblcomment as member_comment,
            tblComment.CommentTime_tblComment as comment_time,
            tblComment.ProposerResponse_tblComment as proposer_response
	from tblComment
    left join tblProposal
    on tblComment.proposal_id = tblProposal.id_tblProposal
    join tblProposalMember
    on tblProposal.id_tblProposal = tblProposalMember.proposal_id
    where tblProposalMember.member_id = in_member_id and tblComment.ProposerResponse_tblComment is null;

	SELECT found_rows() 
    INTO result;

END