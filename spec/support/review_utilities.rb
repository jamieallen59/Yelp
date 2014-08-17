
	def leave_review(thoughts, rating)
		visit '/restaurants'
		click_link('Review KFC')
		fill_in('Thoughts', with: thoughts)
		select rating.to_s, from: 'Rating'
		click_button 'Leave review'
	end