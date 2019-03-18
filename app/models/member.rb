class Member < ApplicationRecord
  include Services
  include UrlParser

  devise :database_authenticatable, :registerable

  paginates_per 10

  VALID_URL_FORMAT = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

  VALID_NAME_FORMT = /\A^[a-z\s]+\z/i

  validates :name, :url, :shortened_url, :email, :password, presence: true
  validates :url,  :email, uniqueness: true
  validates :url,   format: {with: VALID_URL_FORMAT }
  validates :name,  format: { with: VALID_NAME_FORMT, message: I18n.t("errors.letters_only") }
  validates :email, format: {with: Admin::VALID_EMAIL_REGEX }

  has_many :headings, dependent: :destroy

  accepts_nested_attributes_for :headings

  scope :others,         -> ( id )  { where("members.id not in (?)", id ) }
  scope :match_headings, -> ( text ){ joins(:headings).where("headings.text LIKE (?)", "%#{text}%" ).distinct }

  def set_shortened_url_and_headings
    self.attributes = {
      shortened_url:       Services::ShortenUrl.new( self.url ).convert,
      headings_attributes: fetch_headings( self.url )
    }
  end

end

