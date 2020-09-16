class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :management

  validates :postcode, :prefecture_id, :city, :address,:phone_number,  presence: true
  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :phone_number, format: {with: /\A\d{11}\z/}
end
