class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :shine, :price, :rarity, :color, :faces

  has_many :reviews
  has_many :images
end
