json.array!(@admin_microposts) do |admin_micropost|
  json.extract! admin_micropost, :id, :content, :user_id
  json.url admin_micropost_url(admin_micropost, format: :json)
end
