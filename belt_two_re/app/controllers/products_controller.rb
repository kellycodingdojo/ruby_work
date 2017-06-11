class ProductsController < ApplicationController
	

	def create
    # @user = current_user <==== not needed beacuse of the private params. 
    # puts @user
    @product = Product.new product_params
    if @product.save  #< == did not ad the user Id here because we used the merge in the private params. 
      redirect_to "/dashboard/#{@user.id}"
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to :back
    end
  end


  def all_product
  @user = current_user
  @products = Product.where.not(user_id: session[:user_id])

 

end




def destroy
    # @user = current_user
    @product = Product.find(params[:id])
    if @product.user === current_user
      @product.destroy
      redirect_to :back
    else
      flash[:errors] = ["no premission."]
      redirect_to :back
    end
  end




private
    def product_params
      params.require(:product).permit(:name, :price).merge(user: current_user)
    end
# mergre user will ad the user to the product table when a row is created. 


end