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

describe 'editing a restaurant' do
	before(:each) do
		sign_up
		Restaurant.create!(name: 'KFC')
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

describe 'displaying an average rating' do

	let(:restaurant) { Restaurant.create!(name: 'Nandos') }

	context 'If there are no reviews' do
		it 'returns N/A' do
			expect(restaurant.average_rating).to eq 'N/A'
		end
	end

	context 'if there is one review' do
		it 'the average rating returns that rating' do
			restaurant.reviews.create!(rating: 4)
			expect(restaurant.average_rating).to eq 4
		end
	end

	context 'multiple reviews' do
		it 'returns the average of all ratings' do
			restaurant.reviews.create!(rating: 3)
			restaurant.reviews.create!(rating: 5)
			expect(restaurant.average_rating).to eq 4
		end

		it 'returns a float if the average is not a whole number' do
			restaurant.reviews.create!(rating: 4)
			restaurant.reviews.create!(rating: 5)
			expect(restaurant.average_rating).to eq 4.5
		end
	end

end

end
