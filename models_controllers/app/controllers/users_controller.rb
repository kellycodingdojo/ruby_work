class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def new
  end

  def create
    User.create(first_name: params[:first_name])
    redirect_to "/users"
  end

  def show
    render json: User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(first_name: params[:first_name])
    redirect_to :root
  end

  def total
    render json: { total: User.count }
  end
end