require 'rails_helper'

describe 'creating a restaurant' do

	context 'logged out' do
		it 'should prompt to sign in' do
			visit '/restaurants'

			expect(page).to have_content 'Sign in'
		end
	end

	context 'logged in' do
		before do
			jamie = User.create(email: 'ja@mail.com', password: '12345678', password_confirmation: '12345678')
			login_as jamie
		end

		context 'a valid restaurant' do
			it 'prompts the user to fill out a form, then displays the new restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'

			fill_in 'Name', :with => 'KFC'
			click_button 'Create Restaurant'

			expect(page).to have_content 'KFC'
			expect(current_path).to eq '/restaurants'
		end
	end

	context 'an invalid restaurant' do

		it 'shows an error due to an uncapitalised name that is too short' do
			visit '/restaurants'
			click_link 'Add a restaurant'

			fill_in 'Name', :with => 'ab'
			click_button 'Create Restaurant'

			expect(page).not_to have_content 'ab'
			expect(page).not_to have_css 'a', text: 'ab'
		end
	end
end
end
