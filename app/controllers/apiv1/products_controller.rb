module Apiv1
  class ProductsController < ApplicationController
    def index
      products = Product.all.includes(:reviews, :images)
      render json: products, status: 200
    end
  end
end
