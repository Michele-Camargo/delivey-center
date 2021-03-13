class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer  :external_code_purchase
      t.integer  :store
      t.string   :sub_total
      t.string   :delivery_fee
      t.integer  :total_shipping
      t.string   :total
      t.string   :country
      t.string   :state
      t.string   :city
      t.string   :street
      t.string   :complement
      t.datetime :dt_order_create
      t.string   :postal_code
      t.string   :number
      t.string   :external_code_customer
      t.string   :customer_name
      t.string   :customer_email
      t.string   :customer_contact
      t.string   :external_code_item
      t.string   :item_name
      t.boolean  :item_price
      t.integer  :item_quantity
      t.boolean  :item_total
      t.string   :payment_type
      t.boolean  :paymant_value
      t.timestamps
      #adiconar "latitude": -23.629037, "longitude":  -46.712689
      #adicionar "sub_itens":[]
    end

  end
end
