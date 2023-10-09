class OrdersController < ApplicationController
  def neworder
    property_1 = Property.find(order_params[:property_id])
    quantity_1 = order_params[:quantity]

    order = Order.create(user_id: order_params[:user_id])
    order_items = OrderItem.create(order_id: order.id, property_id: order_params[:property_id], quantity: order_params[:quantity], item_price: property_1.price_in_cents * quantity_1)
    user = User.find(order_params[:user_id])
    user.update(current_order: order.id)
    order_items = order.order_items
  end
end
