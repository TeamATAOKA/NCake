class Post < ApplicationRecord
	belongs_to :user
	def full_address
		[postcode, address, name].join(' ')
	end
end
