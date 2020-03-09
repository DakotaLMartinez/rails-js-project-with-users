json.extract! track, :id, :name, :duration, :last_fm_url, :artist_name, :artist_mbid, :album_mbid, :album_id, :created_at, :updated_at
json.url track_url(track, format: :json)
