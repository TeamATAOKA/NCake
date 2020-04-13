class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :orders
  has_many :posts
  def name
		first_name + last_name
  end

  def name_kana
    first_name_kana + last_name_kana
  end

  #会員ステータスのデフォルト値を設定
  attribute :user_status, :string, default: '有効'

end
