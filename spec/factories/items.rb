FactoryBot.define do
  factory :item do
  name                {Faker::Name.initials(number: 2)}
  details             {"詳細を記述"}
  category_id         {2}
  condition_id        {2}
  delivery_fee_id     {2}
  ship_area_id        {3}  
  ship_days_id        {3}
  price               {"5000"}
  association :user
  end
end
