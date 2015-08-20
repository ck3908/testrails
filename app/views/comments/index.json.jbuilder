json.array!(@comments) do |comment|
  json.extract! comment, :id, :title, :author, :content, :rating, :movie_id
  json.url comment_url(comment, format: :json)
end
