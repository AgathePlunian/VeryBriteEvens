class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event



  after_create :participation_send
  def participation_send
    ParticipationMailer.participation_email(self).deliver_now
  end
end
