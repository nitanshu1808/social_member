FactoryBot.define do
  factory :member do
    name            { FFaker::Name.first_name }
    url             { FFaker::InternetSE.http_url }
    shortened_url   { FFaker::Youtube.share_url }
  end
end
