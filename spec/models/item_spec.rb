require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("images/okinawa.jpg")

  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいく時' do
      it "imageとname,detailsとcategory_id,condition_idとdelivery_fee_id, ship_area_idとship_days_id, priceとuser_idが全て問題なければ登録できる" do
        expect(@item).to be_valid
      end      
    end
   
    context '商品出品登録がうまくいかない時' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "detailsが空では登録できない" do
        @item.details = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = "", {id:1,name: '---' }
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空では登録できない" do
        @item.condition_id = "", {id:1,name: '---' }
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "delivery_fee_idが空では登録できない" do
          @item.delivery_fee_id = "", {id:1,name: '---' }
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "ship_area_idが空では登録できない" do
        @item.ship_area_id = "", {id:1,name: '---' }
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end
      it "ship_days_idが空では登録できない" do
        @item.ship_days_id = "", {id:1,name: '---' }
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship days can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字かつ300~9999999の間で入力してください")
      end
      it "priceが10000000以上だと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字かつ300~9999999の間で入力してください")
      end
      it "priceが全角だと登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字かつ300~9999999の間で入力してください")
      end
      it "priceが英字だと登録できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字かつ300~9999999の間で入力してください")
      end
      it "ユーザーが紐付いていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end