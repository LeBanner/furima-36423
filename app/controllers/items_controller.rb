class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :current, only: [:edit, :update, :destroy]
  before_action :pay_check, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end  

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit   
    end  
  end  

  def destroy
    redirect_to root_path if @item.destroy
  end    

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :status_id, :postage_id, :place_id, :schedule_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
   end

  def current
    unless current_user.id == @item.user_id
       redirect_to root_path
     end  
   end 

  def pay_check
    if @item.purchase.present? 
      redirect_to root_path
    end
  end
end
