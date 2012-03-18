module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_admin?
    !current_user.nil? and current_user.admin?
  end

  def deny_access
    redirect_to signin_path, :notice => "please sign in"
  end

  private
    def authenticate
      deny_access unless signed_in?
    end

    def authenticate_admin
      redirect_to home_path unless signed_in_admin?
    end

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
