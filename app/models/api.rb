class Api < ApplicationRecord
  validates :external_code, :store_id, :sub_total, :delivery_fee, :total_shipping, :total,
            :country, :state, :city, :district, :street, :complement, :dt_order_create, 
            :postalCode, :number
          
  has_one :customers, dependent: :destroy
  has_one :items, dependent: :destroy
  has_one :payments, dependent: :destroy
  
end
