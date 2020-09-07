class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_area
  belongs_to_active_hash :ship_days
  has_one_attached :image
  belongs_to :user
 
  validates :image, :name, :details, :category, :condition, :delivery_fee, :ship_area, :ship_days, :price, presence: true
  validates :category_id, :condition_id, :delivery_fee_id, :ship_area_id, :ship_days_id, numericality: { other_than: 1 }
  validates :price, format:{with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."},inclusion:{in: 300..9999999,message: "is out of setting range"}
end
