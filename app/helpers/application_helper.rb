module ApplicationHelper
  def full_title(page_title = 'post')
    return page_title if page_title.empty?
    "#{page_title} | #{base_title}"
  end

#   def safe_role?
#     ability = Ability.new(current_user)
#     ability.admin?
#   end
end
