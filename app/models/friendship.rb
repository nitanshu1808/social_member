class Friendship < ApplicationRecord
  STATUS_OPTIONS = %w(pending request_declined friends )

  belongs_to :member
  belongs_to :friend, class_name: 'Member'

  validates :status, :member, :friend, presence: true
  validates :status, :inclusion => {:in => STATUS_OPTIONS, message: I18n.t("app.invalid_status") }
  validates_uniqueness_of :member_id, scope: :friend_id, message:   I18n.t("errors.already_friend")
  validate :not_self

  enum status: STATUS_OPTIONS

  scope :is_friend, -> (id){ where("member_id = ? OR friend_id = ? and status = 2", id, id ) }

  def not_self
    errors.add(:base, I18n.t("errors.own_friend")) if member == friend
  end

end
