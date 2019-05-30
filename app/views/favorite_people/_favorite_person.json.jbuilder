json.extract! favorite_person, :id, :firstname, :lastname, :prefixTitle, :image, :user_id, :created_at, :updated_at
json.url favorite_person_url(favorite_person, format: :json)
