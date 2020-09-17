class AddressManagement

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address,:building, :phone_number,:user_id, :item_id, :token
  
  validates :token,:postcode, :prefecture_id, :city, :address, :phone_number,  presence: true
  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :phone_number, format: {with: /\A\d{11}\z/},length: { maximum: 11 }
  
  def save
    management = Management.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city,address: address, building: building, phone_number: phone_number, management_id: management.id)
  end
end