module Apiv1
  class ProductsController < ApplicationController
    def index
      if search_price = params[:price]
        products = Product.by_price(search_price).includes(:reviews, :images)
      else
        products = Product.all.includes(:reviews, :images)
      end
      render json: products, status: 200
    end
  end
end
