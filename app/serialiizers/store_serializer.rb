class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_name,:address, :authentication_token, :picture,:store_category_id, :mobile
  has_one :store_category
  
end