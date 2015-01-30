class SessionsController < ApplicationController
   
   # searches for user using submitted e-mail, and then checks if 
   # user exists and authenticates using submitted password. 
   # If these check out, then it will sign-in user.
  def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    flash[:success] = 'Thank you for signing in!'
    sign_in user
    redirect_to root_path        
  else
    flash.now[:error] = 'Invalid email/password combination'
    render 'new'
  end
end

  def destroy
    sign_out
    redirect_to root_path
  end


end
