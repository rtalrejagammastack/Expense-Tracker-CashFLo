module ApplicationHelper
  def user_categories
    current_user.categories
  end
end
