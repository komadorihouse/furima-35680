class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_judgment, only: [:edit, :update, :destroy]
  before_action :order_judgment, only: [:edit, :destroy, :update]

  def index
    @items = Item.all.order(created_at: 'DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def user_judgment
    unless current_user.id == @item.user_id
        redirect_to action: :index
    end
  end

  def order_judgment
    if @item.order.present?
      redirect_to action: :index
    end
  end

  def items_params
    params.require(:item).permit(:product_name, :product_descrip, :category_id, :product_status_id, :shipping_charge_id,
                                 :region_id, :shipping_period_id, :price, :image).merge(user_id: current_user.id)
  end
end
