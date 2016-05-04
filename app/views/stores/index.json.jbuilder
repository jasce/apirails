json.array!(@stores) do |store|
  json.extract! store, :id, :store_name, :name, :mobile, :store_type, :city, :print_bill, :delivery_persons, :delivery_range
  json.url store_url(store, format: :json)
end
