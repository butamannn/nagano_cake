class Public::CustomersController < ApplicationController
  def show
    @user = current_customer
  end

  def edit
    @user = current_customer
  end

  def update
    @user = current_customer
    if @user.update(end_user_params)
      flash[:success] = "メールアドレスを更新しました"
      redirect_to customer_path
    else
      render :exit
    end
  end

  def unsubscribe
  end

  def withdrawal
    user = Customer.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email)
  end
end
