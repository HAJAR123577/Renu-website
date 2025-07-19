json.extract! annonce, :id, :titre, :description, :prix, :created_at, :updated_at
json.url annonce_url(annonce, format: :json)
