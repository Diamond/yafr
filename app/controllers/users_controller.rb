class UsersController < ApplicationController
  before_filter :is_logged_in?, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to edit_user_path(user), notice: "New user account created successfully!"
    else
      redirect_to :back, alert: "User creation failed: #{user.errors.join(', ')}"
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
    redirect_to edit_user_path(user), notice: "User details updated!"
  end

  def index
    @user = current_user
  end

  private
  def is_logged_in?
    current_user.present?
  end
end
