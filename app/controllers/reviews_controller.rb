class ReviewsController < ApplicationController
  def new
    @restaurant = find_restaurant # id is defined in new route in reviews routes
    # @review = Review.new
    # @review.restaurant = @restaurant
    @review = @restaurant.reviews.build # Automatically link the new review to the current restaurant we are looking at
  end

  def create
    review = Review.new(review_params)
    review.restaurant = find_restaurant
    if review.save
      redirect_to restaurant_path(review.restaurant)
    else
      render :new
    end
  end

  private

  def find_restaurant
    Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
