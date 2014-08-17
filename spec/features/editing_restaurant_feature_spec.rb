require 'rails_helper'

describe 'editing a restaurant' do
	before(:each) do
		@jamie = User.create(email: 'ja@mail.com', password: '12345678', password_confirmation: '12345678')
		@jamie.restaurants.create(name: 'KFC')
		# sign_up
		# Restaurant.create!(name: 'KFC')
	end


	context 'logged in as the restaurant creator' do
		before do
			login_as @jamie
		end

		it 'prompts the user to fill in a form and then displays the restaurant' do
			visit '/restaurants'
			click_link 'Edit KFC'

			fill_in 'Name', :with => 'Kentucky Fried Chicken'
			click_button 'Update Restaurant'

			expect(page).to have_content 'Kentucky Fried Chicken'
			expect(current_path).to eq '/restaurants'
		end
	end

	context 'logged in as another user' do
		before do
			bob = User.create(email: 'bob@mail.com', password: '12345678', password_confirmation: '12345678')
			login_as bob
		end
		
		it 'should display an error' do
			visit '/restaurants'
			click_link 'Edit KFC'

			expect(page).to have_content 'This is not your restaurant!'
		end
	end

end