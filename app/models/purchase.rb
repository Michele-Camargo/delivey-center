class Purchase < ApplicationRecord
  validates :external_code, :store_id, :sub_total, :delivery_fee, :total_shipping, :total,
            :country, :state, :city, :district, :street, :complement, :dt_order_create, 
            :postalCode, :number, :type, :value, :external_code, :name, :price, :quantity,
            :total, :external_code, :name, :email, :contact

end
