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
  default_scope { order(created_at: :desc) }

  # after_create_commit -> { NotificationBroadcastJob.perform_later(self) }

  scope :unread, -> { where(read: false) }
end
