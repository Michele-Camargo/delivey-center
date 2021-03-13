class Costomer < ApplicationRecord
  belongs_to :api
  validates :external_code, :name, :email, :contact
end
