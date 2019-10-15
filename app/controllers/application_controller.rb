class ApplicationController < ActionController::Base

    private
    def current_admin
        @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end

    def authorize
        redirect_to '/login' if current_admin.nil?
    end
    helper_method :current_admin
end
