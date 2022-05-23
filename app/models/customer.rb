class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def active_for_authentication?
    super && (is_active == true)
  end
  
  def full_address_current_customer
    '〒' + postal_code + ' ' + address + ' ' + last_name
  end

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy 
  has_many :orders, dependent: :destroy
  

end
