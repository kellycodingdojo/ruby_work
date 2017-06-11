class XmensController < ApplicationController
  def index
    @xmens = Xman.all
  end

  def new
  end

  def create
    @xman = Xman.new(xman_params)

    if @xman.save
      redirect_to :root
    else
      flash[:errors] = @xman.errors.full_messages
      redirect_to :back
    end
  end 

  def show
    @xman = Xman.find(params[:id])
  end

  def edit
    @xman = Xman.find(params[:id])
  end

  def update
    @xman = Xman.find(params[:id])

    if @xman.update(xman_params)
      redirect_to :root
    else
      flash[:errors] = @xman.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Xman.find(params[:id]).destroy
    redirect_to :root
  end

  private
    def xman_params
      params.require(:xman).permit(:name, :power)
    end
end