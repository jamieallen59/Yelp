require 'rails_helper'

RSpec.describe Restaurant, :type => :model do


	let(:restaurant) { Restaurant.create(name: 'Nandos') }
	
	describe 'displaying an average rating' do
		context 'If there are no reviews' do

			it 'returns N/A' do
				expect(restaurant.average_rating).to eq 'N/A'
			end
		end

		context 'if there is one review' do
			it 'the average rating returns that rating' do
				restaurant.reviews.create(rating: 4)
				expect(restaurant.average_rating).to eq 4
			end
		end

		context 'multiple reviews' do
			it 'returns the average of all ratings' do
				restaurant.reviews.create(rating: 3)
				restaurant.reviews.create(rating: 5)
				expect(restaurant.average_rating).to eq 4
			end

			it 'returns a float if the average is not a whole number' do
				restaurant.reviews.create(rating: 4)
				restaurant.reviews.create(rating: 5)
				expect(restaurant.average_rating).to eq 4.5
			end
		end

	end

describe 'validations' do

	it 'is not valid with a name of < 2 characters' do
		restaurant = Restaurant.new(name: 'Ab')
		expect(restaurant).to have(1).error_on(:name)
	end

	it 'is not valid if it does not start with a capital letter' do
		restaurant = Restaurant.new(name: 'nandos')
		expect(restaurant).to have(1).error_on(:name)
	end

	it 'is not valid if it is not unique' do
		Restaurant.create(name: 'Burger King')
		restaurant = Restaurant.create(name: 'Burger King')
		expect(restaurant).to have(1).error_on(:name)
	end
end

end
