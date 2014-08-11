require 'rails_helper'

describe 'restaurants' do

	context 'no restaurants have been aded to the page' do

		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet buddy...'
			expect(page).to have_link 'Add a restaurant'
		end
	end


	context 'new restaurants have been added' do

		before(:each) do
			Restaurant.create(name:'McDonalds')
		end

		it 'should display the restaurants' do
			visit '/restaurants'
			expect(page).to have_content 'McDonalds'
		end
	end

end



