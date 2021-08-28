FactoryBot.define do
  factory :item do
    name              {Faker::Lorem.characters(number: 10) }
    information           {Faker::Lorem.characters(number: 20) }
    price            {Faker::Lorem.characters(number: 4, min_numeric: 4) }
    category_id {2}
    status_id  {2}
    postage_id {2}
    place_id {2}
    schedule_id {2}
    association :user
    after(:build) do |item|
      item.image.attach(io:File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end







