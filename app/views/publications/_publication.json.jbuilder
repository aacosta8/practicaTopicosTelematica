json.extract! publication, :id, :name, :description, :place, :permission_pub, :created_at, :updated_at
json.url publication_url(publication, format: :json)
