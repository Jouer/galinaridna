json.array!(@subjects) do |subject|
  json.extract! subject, :name, :position, :visible
  json.url subject_url(subject, format: :json)
end