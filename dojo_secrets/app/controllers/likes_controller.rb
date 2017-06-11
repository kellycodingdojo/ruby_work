class LikesController < ApplicationController

  # def new
  # end

  def create
    @like = Like.create like_params
    redirect_to '/secrets'

    # @like = Like.new like_params
    # if @like.save
    #   redirect_to '/secrets'
    # else
    #   flash[:errors] = @like.errors.full_messages
    #   redirect_to :back
    # end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy if current_user === @like.user
    redirect_to "/secrets"
    # @like = Like.find(params[:like][:id])
    # if current_user === @like.user
    #   @like.destroy
    #   redirect_to "/secrets"
    # else
    #   flash[:errors] = @like.errors.full_messages
    #   redirect_to "/secrets"
    # end
  end

  private
    def like_params
      params.require(:like).permit(:secret_id).merge(user: current_user)
    end

end
