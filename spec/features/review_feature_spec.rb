require 'rails_helper'
# require 'support/review_utilities'

describe 'leaving a restaurant review' do
		
	before(:each) do
		sign_up
		Restaurant.create(name: 'KFC')
	end

	it 'allows users to leave a review using a form which appears alongside the restaurant' do
		leave_review('3', 'It was ok')

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'It was ok'
	end

	it 'will display the average rating from all reviews' do
		leave_review('4', 'It was nice')
		leave_review('2', 'It was rubbish')

		expect(page).to have_content('Average rating: ★★★☆☆')
	end

end
