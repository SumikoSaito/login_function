module SessionsHelper
  def current_user
    #remember_token = User.encrypt(cookies[:user_remember_token])
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #def log_in(user)
  #  remember_token = User.new_remember_token
  #  cookies.permanent[:user_remember_token] = remember_token
  #  user.update!(remember_token: User.encrypt(remember_token))
  #  @current_user = user
  #end

  #def log_out
  #  @current_user = nil
  #  cookies.delete(:user_remember_token)
  #end

  def logged_in?
    current_user.present?
  end

 private

  def require_log_in!
    redirect_to new_session_path unless logged_in?

  end

end
