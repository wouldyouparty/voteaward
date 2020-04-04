module ApplicationHelper
  def class_string(css_map)
    css_map.find_all(&:last).map(&:first).join(" ")
  end
end
