json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :subscriber_id, :course_id
  json.url subscription_url(subscription, format: :json)
end
