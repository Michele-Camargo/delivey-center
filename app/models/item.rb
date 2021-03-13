class Item < ApplicationRecord
  belongs_to :api
  validates :external_code, :name, :price, :quantity, :total
end