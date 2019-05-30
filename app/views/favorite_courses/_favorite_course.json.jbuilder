json.extract! favorite_course, :id, :title, :short, :url, :user_id, :created_at, :updated_at
json.url favorite_course_url(favorite_course, format: :json)
