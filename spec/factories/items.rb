FactoryBot.define do
  factory :item do
    name              {'test'}
    description       {'test'}
    category_id       {2}
    state_id          {2}
    burden_id         {2}
    prefecture_id     {2}
    delivery_day_id   {2}
    price             {11111}
    association :user

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end
end
