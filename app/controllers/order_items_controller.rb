class OrderItemsController < ApplicationController
  def create
    order = Order.find(order_item_params[:order_id])
    order_items = order.order_items

    found_item = order_items.detect do |item|
      order_item_params[:property_id] == item.property_id
    end
    if found_item
      found_item.quantity += order_item_params[:quantity].to_i
      found_item.item_price = found_item.quantity * found_item.property.price_in_cents
      found_item.save
    else
      orderItem = OrderItem.create(order_item_params)
      orderItem.item_price = orderItem.quantity * orderItem.property.price_in_cents
      orderItem.save
    end
  end
end
