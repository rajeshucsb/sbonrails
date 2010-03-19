# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_flash
    html = "<div id='flash'>"
    flash.each do |key, value|
        html += "<div id='flash_#{key}' class='flash-item #{key}'> #{value} </div>"
      end
    html += "</div>"
  end


  def large_button(text,url,options)
    options[:class] = "large #{options[:color]} button"
    link_to "<span>#{text} &raquo;</span>",url,options
  end

  def large_pulsating_button(text,url,options)
    options[:class] = "large #{options[:color]} pulsating button"
    link_to "<span>#{text} &raquo;</span>",url,options
  end

  def small_button(text,url,options)
    options[:class] = "small #{options[:color]} button"
    link_to "<span>#{text}</span>",url,options
  end



end

