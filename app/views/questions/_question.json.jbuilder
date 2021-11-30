json.extract! question, :id, :creator_id, :company_id, :question, :created_at, :updated_at
json.url question_url(question, format: :json)
