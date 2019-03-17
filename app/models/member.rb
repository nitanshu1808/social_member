class Member < ApplicationRecord
  paginates_per 10
  VALID_URL_FORMAT = /\A(http|https)?:\/\/[a-zA-Z0-9-\.]+\.[a-z]{2,4}\z/

  validates :name, :url, :shortened_url, presence: true
  validates :url, uniqueness: true
  validates :url, format: {with: VALID_URL_FORMAT }
end
