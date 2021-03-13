class Payments < ApplicationRecord
  belongs_to :api
  validates :type, :value
end
