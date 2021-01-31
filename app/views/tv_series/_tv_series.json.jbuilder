json.extract! tv_series, :id, :name, :genre, :price, :season, :created_at, :updated_at
json.url tv_series_url(tv_series, format: :json)
