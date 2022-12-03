class Admin::CustomersController < ApplicationController
  def index
    @users = Customer.with_deleted
  end

  def show
  end

  def edit
  end

  def update
  end
end
