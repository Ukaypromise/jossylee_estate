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

  def checkout
    @order = Order.find_by(id: session[:order_id])
    @order.orderables.destroy_all
    session[:order_id] = nil
    redirect_to order_order_reciept_path
  end

  def order_reciept
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
