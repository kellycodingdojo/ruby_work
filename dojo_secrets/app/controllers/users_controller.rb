class UsersController < ApplicationController

  before_action :user_authorization, except: [:new, :create]

  def new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      if @user.save
        redirect_to "/sessions/new"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to "/users/new"
      end
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    @user = User.find(params[:id])
    @secrets = @user.secrets
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      reset_session
      redirect_to "/users/new"
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # def user_authorization
  #   unless correct_user
  #     flash[:error] = "You do not have access to this page."
  #     redirect_to "/users/#{current_user.id}"
  #   end
  # end

  def user_authorization
    @user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" unless current_user === @user
  end

end
