class Public::ItemsController < ApplicationController
  def index
    @num = Order.where("DATE(created_at) = '#{Date.today}'").count
    @items = Item.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @duplication = 0
    if current_customer
      current_customer.cart_items.each do |cart_item|
        if cart_item.item == @item
          @duplication += 1
        end
      end
    end
  end
end
