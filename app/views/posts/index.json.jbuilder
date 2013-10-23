json.array!(@posts) do |post|
  json.extract! post, :message
  json.url post_url(post, format: :json)
end
