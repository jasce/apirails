json.array!(@business_individuals) do |business_individual|
  json.extract! business_individual, :id, :name, :mobile, :city, :Pan, :Bank_name, :Account_no, :IFSC, :referal
  json.url business_individual_url(business_individual, format: :json)
end
