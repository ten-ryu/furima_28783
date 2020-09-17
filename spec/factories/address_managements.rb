FactoryBot.define do
  factory :address_management do
    token {'aatoken'}
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '高崎市' }
    address { '群馬町3-5' }
    building { 'サニーコート102' }
    phone_number {'09000000000'}
  end
end
