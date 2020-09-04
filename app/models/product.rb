class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_area
  belongs_to_active_hash :ship_day
  has_one_attached :image

  validates :name, :ditails, :category, :condition, :delivery_fee, :ship_area, :ship_day, :price, presence: true
  validates :category_id, :condition_id, :delivery_fee_id, :ship_area_id, :ship_day_id, numericality: { other_than: 1 }
  validates :name, length: { maximum: 40 }
  valisates :ditails, length: { maximum: 1000 }
end
