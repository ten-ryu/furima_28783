class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecrure

  validates :postcode, :prefecture_id, :city, :address, :phone_numcer,  presence: true
  
  validates :prefecture_id, numericality: { other_than: 1 } 
end
