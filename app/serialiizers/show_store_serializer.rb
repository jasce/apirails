class ShowStoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :store_name,:address, :picture , :mobile, :description , :email

  has_one :store_category
 

end