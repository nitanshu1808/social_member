FactoryBot.define do
  factory :friendship do
    association :friend, factory: :member
    association :member
  end
end
