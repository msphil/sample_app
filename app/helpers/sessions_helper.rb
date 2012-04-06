module SessionsHelper

  def sign_in(user)
    # if "remember me" is checked, cookie should be permanent (i.e. across sessions), 
    # otherwise it should be temporary
    #
    # Note: when testing with Firefox, "remember tabs" is a session save ("restore last session") 
    # and keeps session cookies between browser close/open cycles.
    if @remember_me
      cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    else
      cookies.signed[:remember_token] = [user.id, user.salt]
    end
    user.update_attribute(:last_login, Time.now)
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  private 

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

end
