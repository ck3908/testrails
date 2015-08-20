json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :director, :description, :year, :length, :format
  json.url movie_url(movie, format: :json)
end
