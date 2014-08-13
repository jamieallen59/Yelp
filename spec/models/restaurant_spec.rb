require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	it 'is not valid with a name of < 2 characters' do
		restaurant = Restaurant.new(name: 'Ab')
		expect(restaurant).to have(1).error_on(:name)
	end

	it 'is not valid if it does not start with a capital letter' do
		restaurant = Restaurant.new(name: 'nandos')
		expect(restaurant).to have(1).error_on(:name)
	end

	it 'is not valid if it is not unique' do
		Restaurant.create(name: 'Burger King')
		restaurant = Restaurant.create(name: 'Burger King')
		expect(restaurant).to have(1).error_on(:name)
	end

end
