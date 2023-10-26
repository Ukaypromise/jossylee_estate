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
  #   puts @order
  #   tracking_number = SecureRandom.hex(10)
  #   if @order
  #     # Update the order with tracking number the passed in data from the form
  #     @order.update(
  #       email: params[:order][:email],
  #       full_name: params[:order][:full_name],
  #       phone: params[:order][:phone],
  #       address: params[:order][:address],
  #       city: params[:order][:city],
  #       state: params[:order][:state],
  #       postal_code: params[:order][:postal_code],
  #       tracking_number: tracking_number,
  #     )
  #     puts @order
  #     # Clear the session
  #     session[:order_id] = nil
  #     redirect_to order_order_reciept_path
  #   else
  #     # Handle the case where the order is not found
  #     redirect_to order_path
  #   end
  # end

  def checkout
    @order = Order.find_by(id: session[:order_id])
    tracking_number = SecureRandom.hex(10)
    if @order
      if @order.update(
        email: params[:email],
        full_name: params[:full_name],
        phone: params[:phone],
        address: params[:address],
        city: params[:city],
        state: params[:state],
        postal_code: params[:postal_code],
        tracking_number: tracking_number,
      )
        # Clear the session
        session[:order_id] = nil
        redirect_to order_order_reciept_path(order: @order)
      else
        flash.now[:alert] = "Order update failed. Please check the form for errors."
        redirect_to order_path
      end
    else
      # Handle the case where the order is not found
      flash.now[:alert] = "Order not found."
      redirect_to order_path
    end
  end

  def order_reciept
    @order = Order.find_by(id: params[:order])
  end

  def download
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "jossylee_receipt", template: "order/download"
      end
    end
  end

  private

  def set_order
    @order = current_user.orders.find_by(id: session[:order_id])
    unless @order
      @order = current_user.orders.create
      session[:order_id] = @order.id
    end
  end

  def order_params
    params.require(:order).permit(:email, :full_name, :phone, :address, :city, :state, :postal_code, :tracking_number)
  end
end
