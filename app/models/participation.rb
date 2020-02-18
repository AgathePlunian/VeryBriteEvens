class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :admin_send


  def admin_send
    AdminMailer.admin_email(self).deliver_now
   end
end
