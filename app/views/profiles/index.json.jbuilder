json.array!(@profiles) do |profile|
  json.extract! profile, :id, :fristname, :lastname, :brithday
  json.url profile_url(profile, format: :json)
end
