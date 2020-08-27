class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
    @cart_item = CartItem.new
    @items = Item.all
    added = "added"
    @cart_item_cart = CartItem.where("cart_id = ? AND status = ?", @cart.id, added).order(created_at: :asc)
  end

  def new
    @cart = Cart.new
  end

  def cart_confirmado
    @cart = Cart.find(params[:cart_id])
    added = "added"
    @cart_items = CartItem.where("cart_id = ? AND status = ?", @cart.id, added)
    unless @cart_items.empty?
      @cart_items.each do |item|
        item.status = "confirmed"
        item.save
      end
      @cart.status = "closed"
      @cart.save
      redirect_to edit_cart_path(@cart)
      return
    end
    redirect_to pages_path
  end

  def create
    if Cart.where("user_id = ?", current_user.id).last.nil?
      @cart = Cart.new(user_id: current_user.id)
      redirect_to cart_path(@cart.id) if @cart.save
    else
      if Cart.where("user_id = ?", current_user.id).last.status != "open"
        @cart = Cart.new(user_id: current_user.id)
        redirect_to cart_path(@cart.id) if @cart.save
      else
        redirect_to cart_path(Cart.where('user_id = ?', current_user.id).last.id)
        return
      end
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end
end
