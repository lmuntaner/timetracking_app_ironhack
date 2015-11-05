module ApplicationHelper

  def flash_message
    if flash["notice"].present?
      content_tag :p do
        flash["notice"]
      end
    elsif flash["errors"].present?
      content_tag :ul do
        flash["errors"].map do |error_message|
          concat( content_tag(:li, error_message) )
        end
      end
    end
  end
end
