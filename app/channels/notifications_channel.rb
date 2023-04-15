class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications_#{current_user.id}"
    ActionCable.server.broadcast("notifications_#{current_user.id}", {
      count: current_user.notifications.unread.count
    })
  end

  def mark_as_read(data)
    notification = current_user.notifications.find_by(id: data['id'])
    notification.update(read: true) if notification.present?
  end
end
