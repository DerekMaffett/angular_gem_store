module Apiv1
  class ProductsController < ApplicationController
    def index
      products = Product.all
      render json: products, status: 200
    end
  end
end
