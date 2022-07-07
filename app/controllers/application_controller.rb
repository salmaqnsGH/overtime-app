class ApplicationController < ActionController::Base
    include Pundit::Authorization
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    add_flash_types :danger, :info, :warning, :success
end
