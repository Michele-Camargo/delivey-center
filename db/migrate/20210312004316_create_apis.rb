class CreateApis < ActiveRecord::Migration[5.2]
def change
  create_table :apis do |t|
    t.integer :external_code
    t.integer :store
    t.string :sub_total
    t.string :delivery_fee
    t.integer :total_shipping
    t.string :total
    t.string :country
    t.string :state
    t.string :city
    t.string :street
    t.string :complement
    t.datetime :dt_order_create
    t.string :postal_code
    t.string :number
    t.timestamps
    #adiconar "latitude": -23.629037, "longitude":  -46.712689
  end
  # add_reference :custumers, index: true, foreign_key: true
  # add_reference :itens, index: true, foreign_key: true
  # add_reference :payments, index: true, foreign_key: true
end
end
