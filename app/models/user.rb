class User < ActiveRecord::Base
  has_many :posts
  
  
  # When you create a new user, a new token should be created
  before_create :create_remember_token
  
  # provides an #authenticate command, which can be used to 
  # authenticate user by passing the password as an argument
  has_secure_password
  
  validates :password, length: { minimum: 6 }
  
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def current_user=(user)
  @current_user = user
end

def current_user
  remember_token = User.digest(cookies[:remember_token])
  @current_user ||= User.find_by(remember_token: remember_token)
end

def signed_in?
  !current_user.nil?
end
  

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end   
    
end