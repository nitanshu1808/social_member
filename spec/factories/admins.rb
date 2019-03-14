FactoryBot.define do
  factory :admin do
    email          { FFaker::Internet.email }
    name           { FFaker::Name.name }
    password       { email }
  end
end
