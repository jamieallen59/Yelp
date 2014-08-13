class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create 
		@restaurant = Restaurant.find(params[:restaurant_id])
		@restaurant.reviews.create(params[:review].permit(:rating, :thoughts))
		redirect_to '/restaurants'
	end

end
