FactoryBot.define do
  factory :purchase_shipping do
    #カード情報
    number                    { 4242424242424242 }
    exp_month            { 12 }
    exp_year            { 22 }
    cvc    { 123 }
   #発送情報
    postal_code                    { 123-1234}
    prefecture_id            { 2 }
    municipalitie    { "渋谷区" }
    address   { "渋谷1-1-1" }
    telephone_number          { 09012345678 }
    association :purchase
  end
end
