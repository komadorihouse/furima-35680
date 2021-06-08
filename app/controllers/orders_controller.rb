class OrdersController < ApplicationController
  def index 
    @item = Item.find(params[:item_id])
    @order = Purchase.new
  end

  def create
    binding.pry
    @order = Order.new(purchase_params)
    if @purchase.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:user, :item).merge(current_user.id)
  end
  
  def items_params
    params.require(:item).permit(:product_name, :product_descrip, :category_id, :product_status_id, :shipping_charge_id,
                                                :region_id, :shipping_period_id, :price, :image).merge(user_id: current_user.id)
  end
end
