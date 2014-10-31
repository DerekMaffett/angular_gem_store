class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  has_many :reviews
  has_many :images

  def self.by_price(search_price)
    price = case search_price
            when 'cheap'
              50
            when 'medium'
              100
            when 'expensive'
              1000
            end
    where('price > ?', price)
  end
end
