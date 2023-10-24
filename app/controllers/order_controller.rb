class OrderController < ApplicationController
  before_action :set_order, only: [:add, :remove]

  def show
    @render_order = false
  end

  def add
    @property = Property.find_by(id: params[:id])
    current_orderable = @order.orderables.find_by(property_id: @property.id)

    if current_orderable
      current_orderable
    else
      @order.orderables.create(property: @property)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace(
          "order",
          partial: "order/order",
          locals: { order: @order },
        ), turbo_stream.replace(@property)]
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id], order_id: @order.id).destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
                 turbo_stream.replace(
                   "order",
                   partial: "order/order",
                   locals: { order: @order },
                 ),
                 turbo_stream.replace(
                   "orderable",
                   partial: "order/orderables",
                 ),
               ]
      end
    end
  end

  # def checkout
  #   @order = Order.find_by(id: session[:order_id])
  #   @order.orderables.destroy_all
  #   tracking_number = SecureRandom.hex(10)
  #   session[:order_id] = nil
  #   OrderItem.create(property: @order.orderables, user: current_user, tracking_number: tracking_number)
  #   redirect_to order_order_reciept_path
  # end

  def checkout
    @order = Order.find_by(id: session[:order_id])
    tracking_number = SecureRandom.hex(10)
    if @order
      # Create and save order items for the user
      @order.orderables.each do |orderable|
        OrderItem.create(property: orderable.property, user: current_user, tracking_number: tracking_number)
      end

      # Clear the order
      @order.orderables.destroy_all

      session[:order_id] = nil
      redirect_to order_order_reciept_path
    else
      # Handle the case where the order is not found
      redirect_to order_path
    end
  end

  def order_reciept
    @order_items = current_user.order_items
  end

  private

  def set_order
    @order = current_user.orders.find_by(id: session[:order_id])
    unless @order
      @order = current_user.orders.create
      session[:order_id] = @order.id
    end
  end
end
