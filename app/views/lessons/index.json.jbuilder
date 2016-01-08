json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :name, :description, :nr, :video, :course_id
  json.url lesson_url(lesson, format: :json)
end
