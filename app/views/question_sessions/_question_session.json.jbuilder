json.extract! question_session, :id, :interviewee_id, :company_id, :created_at,
              :updated_at
json.url question_session_url(question_session, format: :json)
