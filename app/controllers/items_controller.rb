class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    redirect_to items_path if @item.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :sales_prices, :cost_price, :stock)
  end
end
