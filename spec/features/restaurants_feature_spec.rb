require 'rails_helper'

describe 'restaurants:' do
	context 'if no restaurants have been added to the page' do

		it 'should display a prompt to add a restaurant' do
			sign_up
			visit '/restaurants'
			expect(page).to have_content ('There are no restaurants yet. Please use the button below to add one.')
			expect(page).to have_link ('Add a restaurant')
		end
	end

		it 'should take me to the restaurant create page when I press the "Add a restaurant" link' do
			sign_up
			visit '/restaurants'
			click_link 'Add a restaurant'
			expect(page).to have_content('Add a restaurant.')
		end


	context 'new restaurants have been added' do
		before(:each) do
			sign_up
			Restaurant.create!(name:'McDonalds')
		end

		it 'should display the restaurants' do
			visit '/restaurants'
			expect(page).to have_content 'McDonalds'
		end
	end


	describe 'creating a restaurant' do
		it 'prompts the user to fill in a form and then display the restaurant' do
			sign_up
			visit '/restaurants'
			click_link 'Add a restaurant'

			fill_in 'Name', :with => 'Burger King'
			click_button 'Create Restaurant'

			expect(page).to have_content 'Burger King'
			expect(current_path).to eq '/restaurants'
		end
	end


	describe 'deleting a restaurant' do
		before(:each) do
			sign_up
			Restaurant.create!(name: 'KFC')
		end

		it 'removes a restaurant when the user presses delete' do
			visit '/restaurants'
			click_link 'Delete KFC'

			expect(page).not_to have_content('KFC')
			expect(page).to have_content('Restaurant deleted successfully')
		end
	end

end
