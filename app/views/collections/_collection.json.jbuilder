json.extract! collection, :id, :manifest_url, :html_url, :label, :created_at, :updated_at
json.url collection_url(collection, format: :json)
