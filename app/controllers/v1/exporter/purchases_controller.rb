class V1::Exporter::Purchases < ApplicationController
  require 'ostruct'
  def build(pucharses)
    purchases do |ph|
      purchase = OpenStruct.new
      purchase.external_code_purchase = ph.external_code_purchase
      purchase.store = ph.store
      purchase.sub_total = ph.sub_total
      purchase.delivery_fee = ph.delivery_fee
      purchase.total_shipping = ph.total_shipping
      purchase.total = ph.total
      purchase.country =  ph.country
      purchase.state =  ph.state
      purchase.city =   ph.city
      purchase.street =  ph.street
      purchase.complement =  ph.complement
      purchase.district =  ph.district
      purchase.dt_order_create =  dt.dt_order_create
      purchase.postal_code =  ph.postal_code
      purchase.number =  ph.number
      purchase.external_code_customer =  ph.external_code_customer
      purchase.customer_name =  ph.customer_name
      purchase.customer_email =  ph.customer_email
      purchase.customer_contact =  ph.customer_contact
      purchase.external_code_item =  ph.external_code_item
      purchase.item_name =  ph.item_name
      purchase.item_price =  ph.item_price
      purchase.item_quantity =  ph.item_quantity
      purchase.item_total =  ph.item_total
      purchase.payment_type =  ph.payment_type
      purchase.paymant_value =  ph.paymant_value
    end
    purchase.to_json
  end
  
end