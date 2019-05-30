json.extract! favorite_project, :id, :title, :short, :url, :user_id, :created_at, :updated_at
json.url favorite_project_url(favorite_project, format: :json)
