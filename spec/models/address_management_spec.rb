require 'rails_helper'

RSpec.describe AddressManagement, type: :model do
  describe '購入者情報の保存' do
    before do
      @address_management = FactoryBot.build(:address_management)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@address_management).to be_valid
    end
    it 'postcodeが空だと保存できないこと' do
      @address_management.postcode = nil
      @address_management.valid?
      expect(@address_management.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeにハイフンがないと保存できないこと' do
      @address_management.postcode = '1234567'
      @address_management.valid?
      expect(@address_management.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @address_management.prefecture_id = 1
      @address_management.valid?
      expect(@address_management.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'cityが空だと保存できないこと' do
      @address_management.city = nil
      @address_management.valid?
      expect(@address_management.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @address_management.address = nil
      @address_management.valid?
      expect(@address_management.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @address_management.phone_number = nil
      @address_management.valid?
      expect(@address_management.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが11桁以内でないと保存できないこと' do
      @address_management.phone_number = '080999999999'
      @address_management.valid?
      expect(@address_management.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
    