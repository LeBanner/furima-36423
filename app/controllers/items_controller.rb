class ItemsController < ApplicationController
  def index
  end
    
  def new
    @item = Item.new
  end  

  def create
    binding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end  

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :status_id, :postage_id, :place_id, :schedule_id, :price, :user,).merge(user_id: current_user.id)
  end
end
