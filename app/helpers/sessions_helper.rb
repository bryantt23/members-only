module SessionsHelper
  
  
# creates a new token and sets cookie equal to new token. 
# Then, the user's token is updated with hashed token.
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end
  
  def sign_out
  current_user.update_attribute(:remember_token,
                                User.digest(User.new_remember_token))
  cookies.delete(:remember_token)
  self.current_user = nil
end
  
  
end
