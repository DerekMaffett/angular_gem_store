module Apiv1
  class ReviewsController < ApplicationController
    def create
      product = Product.find(params[:product_id])
      review = product.reviews.build(review_params)
      if review.save
        render json: review, status: 201
      else
        render json: review.errors, status: 500
      end
    end

    def update
      product = Product.find(params[:product_id])
      review = product.reviews.find(params[:id])
      if review.update(review_params)
        render json: review, status: 200
      else
        render json: review.errors, status: 500
      end
    end

    def destroy
      product = Product.find(params[:product_id])
      review = product.reviews.find(params[:id])
      review.destroy

      render nothing: true, status: 204
    end

    private

    def review_params
      params.require(:review).permit(:stars, :body, :author)
    end
  end
end
