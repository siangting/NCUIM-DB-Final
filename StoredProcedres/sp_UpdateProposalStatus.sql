CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_UpdateProposalStatus`(	
	IN in_proposal_id int,
		in_status int,
    OUT affected_row_num int)
BEGIN
	select case
		when in_status > 0 and in_status < 4 and Status_tblProposal < in_status then in_status
		when in_status > 0 and in_status < 4 and  Status_tblProposal > in_status then Status_tblProposal
		else Status_tblProposal
	END AS Status
	INTO in_status
    from tblProposal
    WHERE id_tblProposal = in_proposal_id;
        
    UPDATE tblProposal
	SET Status_tblProposal = in_status
	WHERE id_tblProposal = in_proposal_id;    
    
    SELECT row_count()
    INTO affected_row_num;
    
    SELECT 
    id_tblProposal AS proposal_id,
    Status_tblProposal AS status
    FROM tblProposal
    WHERE id_tblProposal = in_proposal_id;
END