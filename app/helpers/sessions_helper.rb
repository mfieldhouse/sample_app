module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    currnet_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  # Store the full URI of the page which has been requested in
  # the session hash.
  def store_location
    session[:return_to] = request.fullpath
  end
end
