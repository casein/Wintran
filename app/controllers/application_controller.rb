# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.


class ApplicationController < ActionController::Base
  helper :all
  before_filter :get_years, :year_array
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def require_admin_user
      unless current_user.username=="datcpAdmin"
      store_location
      flash[:warning] = "You must be logged in as an administrator to use view this page."
      redirect_to :controller => "pages", :action => "home"
      end
    end

    def require_user
      unless current_user
        store_location
        flash[:log] = "You are not currently logged in."
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        redirect_to :controller => "pages", :action => "home"
        #flash[:notice] = "You must be logged out to access this page."
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def get_years
      @calcYear = Season.all(:select => "DISTINCT(seasonYear)").collect(&:seasonYear).sort.reverse
    end
  
    def year_array
      @year_array = Season.all(:select => "DISTINCT(seasonYear)").map {|y| [y.seasonYear, y.seasonYear]}
    end


  


  protect_from_forgery # :secret => 'a0aa74315a87764985fd273a79fc8e80'

end
