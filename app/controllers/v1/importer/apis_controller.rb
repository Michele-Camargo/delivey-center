class V1::Importer::ApisController < ApplicationController
  def create
    V1::Importer::Purchase.create(params.permit(:external_code_purchase, :store, :sub_total, :delivery_fee, :total_shipping, :total, :country, :state, :city,  :street, :complement, :dt_order_create, :postal_code, :number, :external_code_customer, :customer_name, :customer_email, :customer_contact, :external_code_item, :item_name, :item_price, :item_quantity, :item_total, :payment_type, :paymant_value))
    render plain: {success:true}.to_json, status: 200, content_type: 'application/json'
  end

end
