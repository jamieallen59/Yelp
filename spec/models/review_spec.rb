require 'rails_helper'

RSpec.describe Review, :type => :model do

context 'user input' do
	it 'is valid if given a rating from 1..5 and is associated with a restaurant' do
		restaurant = Restaurant.new(name: 'McDonalds')
		review = Review.new(rating: 4)
		expect(review).to have(0).error_on(:name)
		expect(review).to have(0).error_on(:rating)
	end

	it 'is invalid if the rating > 5' do
		review = Review.new(rating: 10)
		expect(review).to have(1).error_on(:rating)
	end

	it 'is invalid if the rating < 1' do
		review = Review.new(rating: 0)
		expect(review).to have(1).error_on(:rating)
	end

	# it 'is invalid if not associated with a restaurant' do
	# 	restaurant = Restaurant.new(name: 'KFC')
	# 	restaurant.reviews.create(rating: 4, thoughts: 'Whatever')
	# 	# review = Review.new(rating: 5)
	# 	expect(review).to have(1).error_on(:rating)
	# end
end

end
