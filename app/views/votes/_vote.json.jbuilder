json.extract! vote, :id, :voter_id, :question_id, :vote_type, :created_at,
              :updated_at
json.url vote_url(vote, format: :json)
