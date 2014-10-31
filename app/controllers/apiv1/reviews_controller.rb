module Apiv1
  class ReviewsController < ApplicationController
    def create
      review = Review.new(review_params)
      if review.save
        render json: review, status: 201
      else
        render json: review.errors, status: 500
      end
    end

    def update
      review = Review.find(params[:id])
      if review.update(review_params)
        render json: review, status: 200
      else
        render json: review.errors, status: 500
      end
    end

    def destroy
      review = Review.find(params[:id])
      review.destroy

      render nothing: true, status: 204
    end

    private

    def review_params
      params.require(:review).permit(:stars, :body, :author)
    end
  end
end
