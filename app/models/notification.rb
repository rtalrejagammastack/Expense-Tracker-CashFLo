class Notification < ApplicationRecord
  belongs_to :user

  after_create_commit { broadcast_notification }
  
  scope :unread, -> { where(read: false) }

  private

  def broadcast_notification
    ActionCable.server.broadcast("notifications_#{user.id}", {
      notification: self,
      count: user.notifications.unread.count
    })
  end
end
