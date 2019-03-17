class Heading < ApplicationRecord
  paginates_per 10

  HEADING_TAGS = %w(h1 h2 h3 h4 h5 h6)

  validates :text, :tag, presence: true
  validates :tag, inclusion: { in: HEADING_TAGS,
    message: I18n.t("errors.invalid_tag") }

  belongs_to :member
end
