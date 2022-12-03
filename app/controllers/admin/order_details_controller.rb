class Admin::OrderDetailsController < ApplicationController
  def update
    ordered_item = OrderedItem.find(params[:ordered_item][:ordered_item_id])
    order = ordered_item.order
    if params[:ordered_item][:production_status] == "c"
      order.update(status: "c")
    end
    ordered_item.update(production_status: params[:ordered_item][:production_status])
    status = 0
    order = Order.find(params[:id])
    order.ordered_items.each do |ordered_item|
      if ordered_item.production_status != "d"
        status = 1
      end
    end
    if status == 0
      order.update(status: "d")
    end
    redirect_to admin_orders_path
  end
end
