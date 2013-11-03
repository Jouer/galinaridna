json.array!(@pages) do |page|
  json.extract! page, :name, :permalink, :position, :visible
  json.url page_url(page, format: :json)
end