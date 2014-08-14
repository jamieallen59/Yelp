
def sign_up
	visit '/users/sign_up'
	fill_in 'user[email]', :with => 'some@thing.com'
	fill_in 'user[password]', :with => '12345678'
	fill_in 'user[password_confirmation]', :with => '12345678'
	click_button 'Sign up'
end
