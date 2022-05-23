class Item < ApplicationRecord
 validates :name, presence: true
 validates :introduction, presence: true
 validates :price, presence: true
 belongs_to :genre
 has_many :cart_items, dependent: :destroy
 has_many :order_details, dependent: :destroy
 attachment :image
end
