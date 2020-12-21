FactoryBot.define do
  factory :item do
    name             {Faker::Name.name}
    description      {Faker::Lorem.sentence}
    price            {300}
    status_id        {2}
    shipping_cost_id {2}
    shipping_days_id {2}
    prefecture_id    {2}
    category_id      {2}
    
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
