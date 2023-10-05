class CartController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    property = Property.find(params[:property_id])
    current_user.cart.update(property: property)
    redirect_to cart_path
  end

  def view_cart
    @property_in_cart = current_user.cart.property if current_user.cart.present?
  end

  def remove_from_cart
    current_user.cart.update(property: nil)
    redirect_to cart_path
  end
end
