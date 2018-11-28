module ApplicationHelper
  def full_title(page_title = "")
    base_title = "post"
    if page_title.empty?
    base_title
    else
    page_title + " | " + base_title
    end
  end

  def admin_user
    current_user.admin?
  end
end
