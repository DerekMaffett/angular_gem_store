class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :stars, :body, :author
end
