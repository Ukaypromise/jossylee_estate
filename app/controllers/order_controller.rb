class OrderController < ApplicationController
  def show
    @render_order = false
  end

  def add
    @property = Property.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @order.orderables.find_by(property_id: @property.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @order.orderables.create(property: @property, quantity:)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace(
          "order",
          partial: "order/order",
          locals: { order: @order },
        ), turbo_stream.replace(@property)]
        #   render turbo_stream: turbo_stream.replace(
        #     "order",
        #     partial: "order",
        #     locals: { order: @order }
        #   )
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "order",
          partial: "order/order",
          locals: { order: @order },
        )
      end
    end
  end
end
