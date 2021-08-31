class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @item = Item.find(params[:item_id])
    @purchase_transport = PurchaseTransport.new
    if current_user.id == @item.user_id 
      redirect_to root_path
    elsif @item.purchase.present? 
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_transport = PurchaseTransport.new(purchase_params)
    if @purchase_transport.valid?
      pay_item
       @purchase_transport.save
       redirect_to root_path
    else
      render :index
    end
  end
  private

  def purchase_params
    params.require(:purchase_transport).permit(:post, :prefecture, :city, :address, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end



