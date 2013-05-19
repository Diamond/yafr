class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to edit_user_path, notice: "New user account created successfully!"
    else
      redirect_to :back, alert: "User creation failed!"
    end
  end

  def destroy
    # DISABLED UNTIL BETTER SECURITY
    redirect_to :root
    return

    user = User.find(params[:id])
    user.destroy
    redirect_to :root, notice: "User deleted successfully!"
  end

  def edit
    @user = current_user 
  end

  def update
    user = current_user
    user.update_attributes(params[:user])
    redirect_to edit_user_path, notice: "User details updated!"
  end

  def index
    @user = current_user
  end
end
