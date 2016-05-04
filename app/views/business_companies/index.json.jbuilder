json.array!(@business_companies) do |business_company|
  json.extract! business_company, :id, :company_name, :website_url, :company_email, :contact_person, :mobile, :city, :services, :Pan, :Bank_name, :Account_no, :IFSC, :TIN, :TAN, :referal
  json.url business_company_url(business_company, format: :json)
end
