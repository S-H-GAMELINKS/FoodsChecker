json.extract! food, :id, :name, :date, :type, :place, :picture, :created_at, :updated_at
json.url food_url(food, format: :json)
