irc_candidates
person_id
join TO
irc_submissions
person_id

irc_submissions
sub_id_char
joins TO
hrq_qstnr_participants
subject_id

hrq_qstnr_participants
participant_id
joins TO
hrq_qstnr_pcpt_responses_v
participant_id

hrq_qstnr_pcpt_responses_v
question_code
joins TO
hrq_questions_vl
question_code

hrq_qstnr_pcpt_responses_v
qstn_response_id
joins TO
hrq_all_qstn_responses_v
answer_text

answe_text is the answer by candidate


------------


select ircc.person_id,hqv.QUESTION_TEXT,hqv.question_id,hqv.question_type,haqr.answer_text,hqprv.short_text
 from 
 irc_candidates ircc,
 irc_submissions ircs,
hrq_qstnr_participants hqp,
hrq_qstnr_pcpt_responses_v hqprv,
hrq_questions_vl hqv,
hrq_all_qstn_responses_v haqr

where 1=1
and ircc.person_id = ircs.person_id 
and ircs.sub_id_char = hqp.subject_id
and hqp.participant_id = hqprv.participant_id
and hqprv.question_code = hqv.question_code
and hqprv.qstn_response_id = haqr.qstn_response_id
and hqp.PARTICIPANT_TYPE ='CANDIDATE'