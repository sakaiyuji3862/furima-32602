FactoryBot.define do
  factory :order_address do
    post_code     {"000-1111"}
    prefecture_id {2}
    city          {"東松山市"}
    address       {"本町0-0-00"}
    building_name {"東京ハイツ"}
    phone_number  {"09011112222"}
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       {1}
    item_id       {1}
  end
end
