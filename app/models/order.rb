class Order < ApplicationRecord
	belongs_to :user
	has_many :order_item

	#注文ステータスのデフォルト値を設定
	attribute :order_status, :string, default: '入金待ち'
end
