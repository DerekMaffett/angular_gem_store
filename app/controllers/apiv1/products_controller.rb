module Apiv1
  class ProductsController < ApplicationController
    before_action :authenticate_admin!, except: [:index]

    def index
      if search_price = params[:price]
        products = Product.by_price(search_price).includes(:reviews, :images)
      else
        products = Product.all.includes(:reviews, :images)
      end
      render json: products, status: 200
    end

    def create
      product = Product.new(product_params)
      if product.save
        render json: product, status: 201
      else
        render json: product.errors, status: 500
      end
    end

    def update
      product = Product.find(params[:id])
      if product.update(product_params)
        render json: product, status: 200
      else
        render json: product.errors, status: 500
      end
    end

    def destroy
      Product.find(params[:id]).destroy
      render nothing: true, status: 204
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :shine,
        :price, :rarity, :color, :faces)
    end
  end
end
