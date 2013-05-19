class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :root, notice: "Login successful!"
    else
      redirect_to :root, alert: "Email/password combination invalid!"
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
