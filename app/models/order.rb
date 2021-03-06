class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  # 注文モデル
  enum payment_method: { credit_card: 0, transfer: 1 }
  
end
