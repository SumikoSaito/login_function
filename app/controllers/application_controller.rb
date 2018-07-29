class ApplicationController < ActionController::Base

  before_action :current_user
  before_action :require_log_in!
  helper_method :logged_in?

  protect_from_forgery with: :exception
  include SessionsHelper
end
