class ApisController < ApplicationController
  require 'json'

  def initialize(params, type)
    super(params, type)
  end
  
  my_object = {
  "id": 9987071,
  "store_id": 282,
  "date_created": "2019-06-24T16:45:32.000-04:00",
  "date_closed": "2019-06-24T16:45:35.000-04:00",
  "last_updated": "2019-06-25T13:26:49.000-04:00",
  "total_amount": 49.9,
  "total_shipping": 5.14,
  "total_amount_with_shipping": 55.04,
  "paid_amount": 55.04,
  "expiration_date": "2019-07-22T16:45:35.000-04:00",
  "total_shipping": 5.14,
  "order_items": [
    {
      "item": {
        "id": "IT4801901403",
        "title": "Produto de Testes"
      },
      "quantity": 1,
      "unit_price": 49.9,
      "full_unit_price": 49.9
    }
  ],
  "payments": [
    {
      "id": 12312313,
      "order_id": 9987071,
      "payer_id": 414138,
      "installments": 1,
      "payment_type": "credit_card",
      "status": "paid",
      "transaction_amount": 49.9,
      "taxes_amount": 0,
      "shipping_cost": 5.14,
      "total_paid_amount": 55.04,
      "installment_amount": 55.04,
      "date_approved": "2019-06-24T16:45:35.000-04:00",
      "date_created": "2019-06-24T16:45:33.000-04:00"
    }
  ],
  "shipping": {
    "id": 43444211797,
    "shipment_type": "shipping",
    "date_created": "2019-06-24T16:45:33.000-04:00",
    "receiver_address": {
      "id": 1051695306,
      "address_line": "Rua Fake de Testes 3454",
      "street_name": "Rua Fake de Testes",
      "street_number": "3454",
      "comment": "teste",
      "zip_code": "85045020",
      "city": {
        "name": "Cidade de Testes"
      },
      "state": {
        "name": "São Paulo"
      },
      "country": {
        "id": "BR",
        "name": "Brasil"
      },
      "neighborhood": {
        "id": null,
        "name": "Vila de Testes"
      },
      "latitude": -23.629037,
      "longitude": -46.712689,
      "receiver_phone": "41999999999"
    }
  },
  "status": "paid",
  "buyer": {
    "id": 136226073,
    "nickname": "JOHN DOE",
    "email": "john@doe.com",
    "phone": {
      "area_code": 41,
      "number": "999999999"
    },
    "first_name": "John",
    "last_name": "Doe",
    "billing_info": {
      "doc_type": "CPF",
      "doc_number": "09487965477"
    }
  }
}

  def create_purchase(my_object)
    pucharse = Purchase.new
    json = JSON.parse(my_object)
    build_purchase json
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
