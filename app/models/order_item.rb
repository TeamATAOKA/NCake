class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :item

	#制作ステータスのデフォルト値を設定
	attribute :production_status, :string, default: '着手不可'

end
