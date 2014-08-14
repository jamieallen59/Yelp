
	def leave_review(rating, thoughts)
		visit '/restaurants'
		click_link('Leave review')
		fill_in('Thoughts', with: thoughts)
		select rating, from: 'Rating'
		click_button 'Leave review'
	end