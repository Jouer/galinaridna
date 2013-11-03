json.array!(@sections) do |section|
  json.extract! section, :name, :position, :visible, :content_type, :content
  json.url section_url(section, format: :json)
end