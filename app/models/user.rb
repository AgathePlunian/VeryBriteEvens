class User < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  has_many :participations
  has_many :events, through: :participations

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
