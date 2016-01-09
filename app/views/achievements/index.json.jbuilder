json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :user_id, :achievable_type, :achievable_id
  json.url achievement_url(achievement, format: :json)
end
