class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def show
    @notification = current_user.notifications.find_by(id: params[:id])
    @notification.update(read: true) if @notification.present?
  end
  
  def mark_as_read
    notification = current_user.notifications.find_by(id: params[:id])
    notification.update(read: true) if notification.present?
    head :ok
  end

  def index
    @notifications = current_user.notifications
  end

  def mark_all_as_read
    current_user.notifications.unread.update_all(read: true)
    head :ok
  end
end
