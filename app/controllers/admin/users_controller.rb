class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access


  def index
    @users = User.order("firstname").page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.deleted_user_email(@user).deliver

    @user.destroy
    redirect_to admin_users_path, "Deleted"
  end

  protected

end
