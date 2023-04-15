module ApplicationHelper
  def user_categories
    current_user.categories
  end

  def transaction_types
    TransactionType.all
  end

  def image_file(name)
    file_path = Rails.root.join('app', 'assets', 'images', name)
    {
      io: File.open(file_path),
      filename: name,
      content_type: Mime::Type.lookup_by_extension(File.extname(name)[1..]).to_s
    }
  def unread_notification_count
    if current_user.present?
      count = current_user.unread_notification_count
      if count > 0
        content_tag(:span, count, class: 'unread-count', id: 'unread-count')
      end
    end
  end
end
