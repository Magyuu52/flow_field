module ApplicationHelper
  def page_title(title)
    base_title = "FLOW SPOT"
    title.empty? ? base_title : title + " | " +  base_title
  end
end
