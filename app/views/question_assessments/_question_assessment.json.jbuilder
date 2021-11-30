json.extract! question_assessment, :id, :question_id, :interviewee_id, :question_session_id, :created_at, :updated_at
json.url question_assessment_url(question_assessment, format: :json)
