class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def new_token
    token = SecureRandom::urlsafe_base64(32)

    while User.find_by(token: token)
      token = SecureRandom::urlsafe_base64(32)
    end

    return token
  end

  def current_user
    cookies.permanent[:token] ||= new_token
    @current_user ||= User.find_or_create_by(token: cookies[:token])
  end
end
