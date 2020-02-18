class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true
  validates :encrypted_password, presence: true
  has_many :participations
  has_many :events, through: :participations

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self)
  end
end
