json.array!(@users) do |user|
  json.extract! user, :id, :name, :mobile, :house_no, :locality, :pincode
  json.url user_url(user, format: :json)
end
