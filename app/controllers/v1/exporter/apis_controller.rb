class V1::Exporter::ApisController < ApplicationController
  require 'rest-client'
  require 'json'

  def create
    params = V1::Purchase.last
    purchase = {
              "externalCode": params.external_code_purchase,
              "storeId": params.store,
              "subTotal": params.sub_total,
              "deliveryFee": params.delivery_fee,
              "total_shipping": params.total_shipping,
              "total": params.total,
              "country": params.country,
              "state": params.state,
              "city": params.city,
              "district": params.district,
              "street": params.street,
              "complement": params.complement,
              "latitude": -23.629037,
              "longitude":  -23.629037,
              "dtOrderCreate": params.dt_order_create,
              "postalCode": params.postal_code,
              "number": params.number,
              "customer": {
                "externalCode": params.external_code_customer,
                "name": params.customer_name,
                "email": params.customer_email,
                "contact": params.customer_contact
              },
              "items": [
                {
                  "externalCode": params.external_code_item,
                  "name": params.item_name,
                  "price": params.item_price,
                  "quantity": params.item_quantity,
                  "total": params.item_total,
                  "subItems": []
                }
              ],
              "payments": [
                {
                  "type": params.payment_type,
                  "value": params.paymant_value
                }
              ]
            }
    puts "--------#{purchase}"
     RestClient::Request.execute(
      method:  :post, 
      url:     "https://delivery-center-recruitment-api.herokuapp.com/",
      payload: purchase,
      headers: {'X-Sent': DateTime.now.strftime("%Hh%M - %d/%m/%Y")}
    )
  end

end




