class Review < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
	has_many :endorsements

	validates :rating, inclusion: { in: (1..5) }
	validates :restaurant_id, presence: true
	validates :user_id, uniqueness: { scope: :restaurant_id, message: 'has already written a review' }
end
