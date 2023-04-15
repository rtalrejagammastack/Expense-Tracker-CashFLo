# class NotificationBroadcastJob < ApplicationJob
#   queue_as :default

#   # def perform(notification)
#   #   ActionCable.server.broadcast("notifications_#{notification.user_id}", message: notification.message)
#   # end
#   def perform(notification)
#     NotificationsChannel.broadcast_to(notification.user, { message: notification.message, created_at: notification.created_at.strftime("%b %d, %Y at %I:%M%p") })
#   end
# end
