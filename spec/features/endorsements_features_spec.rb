require 'rails_helper'

describe 'endorsing reviews' do

	before do
		sign_up
		restaurant = Restaurant.create(name: 'McDonalds')
		restaurant.reviews.create(rating: 4, thoughts: 'Lovely')
	end

	it 'can endorse reviews, updating the reviews endorsement count', js: true do
		visit '/restaurants'
		click_link 'Endorse review'
		expect(page).to have_content '1 endorsement'
	end


end