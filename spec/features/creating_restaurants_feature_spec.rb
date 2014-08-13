require 'rails_helper'

describe 'creating a restaurant' do

	context 'an invalid restaurant' do
		it 'shows an error due to an uncapitalised name that is too short' do
			visit '/restaurants'
			click_link 'Add restaurant'

			fill_in 'Name', :with => 'Ab'
			click_button 'Create Restaurant'

			expect(page).not_to have_content 'Ab'
			expect(page).not_to have_css 'a', text: 'Ab'
		end
	end


end