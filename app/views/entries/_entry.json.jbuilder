json.extract! entry, :id, :_key, :title, :body, :size, :created_at, :updated_at
json.url entry_url(entry, format: :json)