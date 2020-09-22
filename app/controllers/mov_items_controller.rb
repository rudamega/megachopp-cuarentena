class MovItemsController < ApplicationController
  def index
    @mov = MovItem.all
  end

  def new
    @mov = MovItem.new
  end

  def create
    @mov = MovItem.new
    item = Item.find(@mov.item)
    item.save
    raise
  end
end
