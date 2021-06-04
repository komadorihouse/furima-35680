class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :create]

  def index
    @items = Item.includes(:user).order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:product_name, :product_descrip, :category_id, :product_status_id, :shipping_charge_id,
                                 :region_id, :shipping_period_id, :price, :image).merge(user_id: current_user.id)
  end
end
