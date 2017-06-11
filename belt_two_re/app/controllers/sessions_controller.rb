class SessionsController < ApplicationController
  

   def dashboard
	@user = User.find(params[:id])
	@product = @user.products
  @sales_all = Sale.all

  @sales = @user.transactions 
  @sales_sum = @sales.reduce(0){|sum, sale| sum + sale.product.price}

  @purchases = @user.sales
  @purchase_sum = @purchases.reduce(0){|sum, purchase| sum + purchase.product.price }


# Purchase.joins(:product).where('products.user_id = 4').sum('products.amount') <===ALT
	end


  def buy
    @sale = Sale.new(product_id: params[:id], user_id: session[:user_id])
    @user = current_user
     if @sale.save
        redirect_to "/dashboard/#{@user.id}"
      else
        flash[:errors] = @save.errors.full_messages
        redirect_to "/users/main"
      end
  end





	def create #Log User in with authenticate -- generates flash messages errors
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/dashboard/#{@user.id}"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/"
    end
  end

 def sell
 	redirect_to "/dashboard/#{@user.id}"
 end


def destroy #Logs User out -- sets session[:user_id] to null -- redirects to login page
    reset_session
    redirect_to "/"
  end







end

