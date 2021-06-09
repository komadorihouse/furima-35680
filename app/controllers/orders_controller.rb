class OrdersController < ApplicationController
  def index 
    @item = Item.find(params[:item_id])
    @subscribers = Subscriber.new
  end

  def creat
    @item = Item.find(params[:item_id])
    @subscribers = Subscriber.new(purchase_params)
    if @subscribers.valid?
      @subscribers.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:user, :item)
  end

  def purchase_params
    params.require(:subscriber).permit(:order, :postal_code, :region_id, :city, :street, :building_name, :phone)
  end
  
  def items_params
    params.require(:item).permit(:product_name, :product_descrip, :category_id, :product_status_id, :shipping_charge_id,
                                                :region_id, :shipping_period_id, :price, :image).merge(user_id: current_user.id)
  end
end
