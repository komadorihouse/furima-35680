class OrdersController < ApplicationController
  def index 
    @item = Item.find(params[:item_id])
    @order_subscribers = OrderSubscribers.new
  end

  def create
    @item = Item.find(params[:item_id])
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

  def order_params
    params.require(:order_subscribers).permit(:postal_code, :region_id, :city, :street, :building_name, :phone).merge(user_id: current_user.id).merge(item_id: @item.id).merge(token:params[:token])
  end

  def pay_item
    item_price = Item.find(@item.id)
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: item_price[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end
  
  def items_params
    params.require(:item).permit(:product_name, :product_descrip, :category_id, :product_status_id, :shipping_charge_id,
                                                :region_id, :shipping_period_id, :price, :image).merge(user_id: current_user.id)
  end
end
