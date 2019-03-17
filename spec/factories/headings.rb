FactoryBot.define do
  factory :heading do
    association :member
    tag        { Heading::HEADING_TAGS[rand(0..5)] }
    text       { FFaker::CheesyLingo.sentence }
  end
end
