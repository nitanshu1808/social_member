class Friendship < ApplicationRecord
  STATUS_OPTIONS = %w(pending declined accepted )

  belongs_to :member
  belongs_to :friend, class_name: 'Member'

  validates :status, :member, :friend, presence: true
  validates :status, :inclusion => {:in => STATUS_OPTIONS, message: I18n.t("app.invalid_status") }
  validates_uniqueness_of :member_id, scope: :friend_id, message:   I18n.t("errors.already_friend")
  validate :not_self

  enum status: STATUS_OPTIONS

  def not_self
    errors.add(:base, I18n.t("errors.own_friend")) if member == friend
  end

end
