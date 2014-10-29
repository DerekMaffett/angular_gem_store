class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :shine, :price, :rarity, :color, :faces

  has_many :reviews
  has_many :images
end
