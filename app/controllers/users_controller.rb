class UsersController < ApplicationController
  before_action :set_users, only: %i[promote_user]

  def list
     authorize :user, :list?
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def promote_user
    authorize :user, :promote_user?
    @user = User.find(params[:id])

    if params[:user].present? && params[:user][:role].present?
      new_role = params[:user][:role]

      if @user.promotable_to?(new_role)
        if @user.update(role: new_role)
          redirect_to users_path, notice: "User promoted successfully."
        else
          render :list, alert: "User not promoted."
        end
      else
        render :list, alert: "Promotion not allowed."
      end
    else
      render :list, alert: "Please select a role to promote the user."
    end
  end

  def user_orders
    @user = User.find(params[:id])
    @orders = @user.orders
  end

  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    render :list, alert: "User deleted successfully."
  end

  private

  def set_user
    @user = params[:id] ? User.find(params[:id]) : current_user
  end

  def set_users
    @users = User.all
  end
end
