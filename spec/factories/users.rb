FactoryBot.define do
  factory :user do
    nickname                {"sakai"}
    email                   {"sample@gmail.com"}
    password                {"0000aa"}
    password_confirmation   {"0000aa"}
    family_name             {"酒井"}
    family_name_kana        {"サカイ"}
    first_name              {"悠治"}
    first_name_kana         {"ユウジ"}
    birth_day               {"1985-05-26"}
  end
end
