class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user
    if @review.save
      redirect_to product_path(@review.product)
    else
      redirect_to :back
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :user_id,
      :rating,
      :description
      )
  end

end
