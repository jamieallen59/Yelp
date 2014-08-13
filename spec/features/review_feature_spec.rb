require 'rails_helper'

describe 'leaving a restaurant review' do
		
		before(:each) do
			Restaurant.create(name: 'KFC')
		end

		it 'allows users to leave a review using a form which appears alongside the restaurant' do
			visit '/restaurants'
			click_link('Leave review')

			fill_in('Thoughts', with: 'It was ok')
			select '3', from: 'Rating'
			click_button 'Leave review'

			expect(current_path).to eq '/restaurants'
			expect(page).to have_content 'It was ok'
		end
end