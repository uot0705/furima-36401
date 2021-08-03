FactoryBot.define do
  factory :item do
    name                    { 'テスト'}
    explanation            { 'テスト' }
    product_category_id    { '2' }
    product_condition_id   { '2' }
    delivery_fee_id        { '2' }
    prefecture_id          { '2' }
    delivery_day_id        { '2' }
    price                  { '1000' }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
   
  end
end
