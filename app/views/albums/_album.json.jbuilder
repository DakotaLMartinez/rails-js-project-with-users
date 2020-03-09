json.extract! album, :id, :title, :artist_name, :image_url, :mbid, :created_at, :updated_at
json.url album_url(album, format: :json)
