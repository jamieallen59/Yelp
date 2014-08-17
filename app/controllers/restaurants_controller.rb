class RestaurantsController < ApplicationController
	before_action :authenticate_user!

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant].permit(:name))
		@restaurant.user = current_user

		if @restaurant.save
			redirect_to '/restaurants'
		else
			render 'new'
		end
	end

	def edit
			@restaurant = current_user.restaurants.find(params[:id])	

		rescue ActiveRecord::RecordNotFound
			flash[:notice] = 'This is not your restaurant!'
			redirect_to '/restaurants'
	end

	def update
		@restaurant = current_user.restaurants.find(params[:id])
		@restaurant.update(params[:restaurant].permit(:name))

		redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		flash[:notice] = 'Restaurant deleted successfully'
		redirect_to '/restaurants'
	end

end
