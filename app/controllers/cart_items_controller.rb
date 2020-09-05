class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new
    @cart_item.item_id = params[:cart_item][:item_id]
    @cart_item.cart_id = params[:cart_id]
    @cart_item.status = "added"
    @cart_item.quantity = 1
    @cart_item.price = params[:cart_item][:price]
    @cart_item.save!
    #redirect_to cart_path(@cart_item.cart_id)
    redirect_to cart_path(params[:cart_id])
  end

  def edit
    @item = CartItem.find(params[:id])
  end

  def update
    @item = CartItem.find(params[:id])
    @item.price = params[:cart_item][:price]
    @item.quantity = params[:cart_item][:quantity]
    redirect_to cart_path(@item.cart_id) if @item.save
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart = @cart_item.cart
    @cart_item.destroy
    redirect_to cart_path(@cart.id)
  end
end
