class ProductsController < ApplicationController




	def create
    @user = current_user
    @product = Product.new product_params
    if @product.save
      redirect_to "/dashboard/#{@user.id}"
    else
      flash[:errors] = @secret.errors.full_messages
    end
  end

def destroy
    @user = current_user
    @product = Product.find(params[:id])
    puts @user, @product, "!!!!!!!!!!!!!"
    if @product.user === current_user
      @product.destroy
      redirect_to :back
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to :back
    end
  end




private
    def product_params
      params.require(:product).permit(:name, :price)
    end



end


# .merge(user: current_user)