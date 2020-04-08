json.extract! conference, :id, :room, :name, :password, :created_at, :updated_at
json.url conference_url(conference, format: :json)
