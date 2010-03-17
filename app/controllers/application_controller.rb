# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  before_filter :authenticate, :except => [:index,:show,:ideas]
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  def self.errors_for(obj)
    obj.errors.full_messages.map { |msg| "<span>#{CGI::escapeHTML msg}</span>" }.join("<br />\n")
  end

end
