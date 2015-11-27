class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, Mr.#{@user.lastname}"
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

  def admin?
    User.find(session[:user_id]).admin
  end

  def admin_redirect
    redirect_to admin_users_path, notice: "User created" if admin?
  end

end
