class SecretsController < ApplicationController

  def index
    @secrets = Secret.all
  end

  def new
  end

  def create
    @user = current_user
    @secret = Secret.new secret_params
    if @secret.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @secret.errors.full_messages
    end
  end

  def destroy
    @user = current_user
    @secret = Secret.find(params[:id])
    if @secret.user === current_user
      @secret.destroy
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @secret.errors.full_messages
      redirect_to :back
    end
  end

  private
    def secret_params
      params.require(:secret).permit(:content).merge(user: current_user)
    end
end
