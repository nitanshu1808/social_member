class Member < ApplicationRecord
  include Services

  paginates_per 10

  VALID_URL_FORMAT = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

  VALID_NAME_FORMT = /\A^[a-z\s]+\z/i

  validates :name, :url, :shortened_url, presence: true
  validates :url, uniqueness: true
  validates :url, format: {with: VALID_URL_FORMAT }
  validates :name, format: { with: VALID_NAME_FORMT, message: I18n.t("errors.letters_only") }

  def set_shortened_url
    self.attributes = {
      shortened_url: Services::ShortenUrl.new( url ).convert
    }
  end

end
