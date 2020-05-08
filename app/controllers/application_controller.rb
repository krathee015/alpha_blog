class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in? #it will make current_user and logged_in?available for views as well for controller

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user       
    end
end
