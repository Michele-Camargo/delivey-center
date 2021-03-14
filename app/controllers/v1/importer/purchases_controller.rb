class V1::Importer::Purchases < ApplicationController
  require 'json'
  attr_reader :params, :type

  def initialize(params)
    @params = JSON.parse(params)
  end

  def create_purchase
    pucharse = Purchase.new
    build_purchase pucharse
    pucharse
  end
  
  def build_purchase(purchase)
    purchase.external_code_purchase = @params.dig(:id)
    purchase.store = @params.dig(:store_id)
    purchase.sub_total = @params.dig(:total_amount_with_shipping)
    purchase.delivery_fee = @params.dig(:paid_amount)
    purchase.total_shipping = @params.dig(:total_shipping)
    purchase.total = @params.dig(:total_amount)
    purchase.country = @params.dig(:shipping, :receiver_address, :country, :name)
    purchase.state = @params.dig(:shipping, :receiver_address, :state, :name)
    purchase.city =  @params.dig(:shipping, :receiver_address, :city, :name)
    purchase.street = @params.dig(:shipping, :receiver_address, :address_line)
    purchase.complement = @params.dig(:shipping, :receiver_address, :comment)
    purchase.district = @params.dig(:shipping, :receiver_address, :neighborhood, :name)
    purchase.dt_order_create = @params.dig(:shipping, :date_created)
    purchase.postal_code = @params.dig(:shipping, :receiver_address, :zip_code)
    purchase.number = @params.dig(:shipping, :receiver_address, :street_number)
    purchase.external_code_customer = @params.dig(:buyer, :id)
    purchase.customer_name = "#{@params.dig(:buyer, :first_name)} #{@params.dig(:buyer, :last_name)}" 
    purchase.customer_email = @params.dig(:buyer, :email)
    purchase.customer_contact = "#{@params.dig(:buyer, :phone, :area_code)} #{@params.dig(:buyer, :phone, :number)}" 
    purchase.external_code_item = @params.dig(:order_items, :item, :id)
    purchase.item_name = @params.dig(:order_items, :item, :title)
    purchase.item_price = @params.dig(:order_items, :unit_price)
    purchase.item_quantity = @params.dig(:order_items, :quantity)
    purchase.item_total = @params.dig(:order_items, :full_unit_price)
    purchase.payment_type = @params.dig(:payments, :payment_type)
    purchase.paymant_value = @params.dig(:payments, :total_paid_amount)
    purchase
  end
  

end