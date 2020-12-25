FactoryBot.define do
  factory :address do
    post_code     {"000-1111"}
    prefecture_id {2}
    city          {"東松山市"}
    address       {"本町0-0-00"}
    building_name {"東京ハイツ"}
    phone_number  {"09011112222"}

    association :order

  end
end
