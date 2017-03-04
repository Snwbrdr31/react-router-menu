class Api::MenuItemsController < ApplicationController
  before_action :set_menu
  before_action :set_menu_item, except: [:index, :create]

  def index
    @menu_items = @menu.menu_items
    render json: Menu.all
  end

  def show

  end

  def create
    @menu_item = Menu_Item.create(menu_item_params)
    if @menu_item.save
      render json: @menu_item
    else
      render json: { errors: @menu_item.errors}, status: 401
    end
  end

  def update
    if @menu_item.update(menu_params)
      render json: @menu_item
    else
      render json: { errors: @menu_item.errors }, status: 401
    end
  end

  def destroy
    @menu_item.destroy
  end

private
  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :menu_id)
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
  
  def set_menu_item
    @menu_item = @menu.menu_items.find(params[:id])
  end
end
