class Item < ApplicationRecord
	belongs_to :genre
	attachment :image
	has_many :order_items
	has_many :cart_items
end
