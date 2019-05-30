json.extract! favorite_thesis, :id, :title, :short, :url, :user_id, :created_at, :updated_at
json.url favorite_thesis_url(favorite_thesis, format: :json)
