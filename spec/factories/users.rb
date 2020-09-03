FactoryBot.define do
  factory :user do
    nickname              {"amatatsu"}
    email                 {"aaa@icloud.com"}
    password              {"a11223"}
    password_confirmation {password}
    last_name             {"天田"}
    first_name            {"辰也"}
    last_name_kana        {"アマダ"}
    first_name_kana       {"タツヤ"}
    birthday              {"1982/5/4"}
  end
end