class Review < ActiveRecord::Base
  validates :body, presence: true
  validates :stars, presence: true
  validates :author, presence: true

  belongs_to :product
end
