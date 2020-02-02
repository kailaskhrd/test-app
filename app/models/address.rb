class Address < ApplicationRecord
  belongs_to :user

  validates :line_1, :city, :state, :pincode, presence: true
  validates_format_of :pincode, :with => /\A[1-9][0-9]{5}$\z/ ,:if => lambda{ |address| address.pincode.present? }
end
