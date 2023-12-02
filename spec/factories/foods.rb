FactoryBot.define do
  factory :food do
    name { 'Some Food' }
    measurment_unit { 'Unit' }
    price { 10.99 }
    quantity { 1 }
    user
  end
end
