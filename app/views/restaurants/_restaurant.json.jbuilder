json.extract! restaurant, :id, :image, :name, :place, :user_id, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
