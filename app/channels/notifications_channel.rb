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
    stream_for current_user
  end

  def send_notification(data)
    notification = current_user.notifications.create(content: data['message'])
    NotificationsChannel.broadcast_to(current_user, notification: render_notification(notification))
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def render_notification(notification)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification })
  end
end
