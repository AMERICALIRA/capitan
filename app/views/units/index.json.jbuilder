json.array!(@units) do |unit|
  json.extract! unit, :id, :title, :description, :course_id
  json.url unit_url(unit, format: :json)
end
