module Auth
  def login(user)
    reset_session

    session[:app] = {
      user_id: user.id
    }
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def auth_cred
    @app_session ||= ActiveSupport::HashWithIndifferentAccess.new(session[:app])
  end

  def current_user
    @current_user ||= User.find_by(id: auth_cred[:user_id])
  end

  def authenticate
    return true if current_user

    reset_session

    redirect_to(:new_session)

    false
  end

  def authorize
    true
  end
end
