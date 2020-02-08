class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # skip_before_action :require_login, if: :devise_controller?

    def welcome
    end

    def current_user
    end

    private

    # def require_login
    #     unless user_signed_in?
    #         flash[:error] = "Please login to continue"
    #         redirect_to new_user_session_path
    #     end
    # end


end


