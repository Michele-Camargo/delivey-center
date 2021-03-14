class V1::Exporter::ApisController < ApplicationController
  require 'rest-client'
  require 'json'

  url = 'https://delivery-center-recruitment-ap.herokuapp.com/'
  params = Pucharse.last
  parameters = V1::Exporter::Purchases.create(params.permit(:external_code_purchase, :store, :sub_total, :delivery_fee, :total_shipping, :total, :country, :state, :city,  :street, :complement, :dt_order_create, :postal_code, :number, :external_code_customer, :customer_name, :customer_email, :customer_contact, :external_code_item, :item_name, :item_price, :item_quantity, :item_total, :payment_type, :paymant_value))


  resp = RestClient.post "#{url}", parameters

  puts JSON.parse(resp.body)
end