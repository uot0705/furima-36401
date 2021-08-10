FactoryBot.define do
  factory :purchase_shipping do
    #カード情報
    token {"tok_abcdefghijk00000000000000000"}
   #発送情報
    postal_code                    { "123-1234" }
    prefecture_id            { 2 }
    municipalitie    { "渋谷区" }
    address   { "渋谷1-1-1" }
    building_name  {"渋谷ビル"}
    telephone_number          { "09012345678" }
  end
  

end
