class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :user_judgment, only: [:index, :create]
  before_action :order_judgment, only: [:index, :create]

  def index 
    @order_subscribers = OrderSubscribers.new
    @shipping = ShippingCharge.find(@item.shipping_charge_id)
  end

  def create
    @order_subscribers = OrderSubscribers.new(order_params)
    if @order_subscribers.valid?
      pay_item
      @order_subscribers.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_judgment
    if @item.order.present?
      redirect_to root_path
    end
  end

  def user_judgment
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_subscribers).permit(:postal_code, :region_id, :city, :street, :building_name, :phone).merge(user_id: current_user.id).merge(item_id: @item.id).merge(token:params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
