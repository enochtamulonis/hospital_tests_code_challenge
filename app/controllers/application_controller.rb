class ApplicationController < ActionController::Base

  helper_method :active_page?

  def active_page? current_page
    if current_page?("/#{current_page}")
      "text-green-400"
    else
      "text-white-400"  
    end
  end
end
