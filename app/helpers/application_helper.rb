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
  end
end
