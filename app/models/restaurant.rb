class Restaurant < ActiveRecord::Base
	has_many :reviews

	validates :name, length: { minimum: 3, message: "- the restaurant name must be at least 3 characters long" },
						format: { with: /\A[A-Z].+\z/, message: "- the first letter must be a capital" },
						uniqueness: { scope: :name, message: "- sorry, that restaurant already exists" }
end
