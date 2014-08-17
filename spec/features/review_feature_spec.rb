require 'rails_helper'

describe 'leaving a restaurant review' do
		
	before(:each) do
		jamie = User.create(email: 'ja@mail.com', password: '12345678', password_confirmation: '12345678')
		login_as jamie
		jamie.restaurants.create(name: 'KFC')
	end

	it 'allows users to leave a review using a form which appears alongside the restaurant' do
		leave_review('It was ok', '3')

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'It was ok (★★★☆☆)'
	end

	it 'will display the average rating from all reviews' do
		leave_review('It was nice', '4')

		bob = User.create(email: 'bob@mail.com', password: '12345678', password_confirmation: '12345678')
		login_as bob
		leave_review('It was rubbish', '2')

		expect(page).to have_content('Average rating: ★★★☆☆')
	end

	it 'does not allow user to write duplicate reviews' do
		leave_review('It was fantastic!', '4')
		expect(page).not_to have_link 'Review KFC'
	end

end
