class Api::MenusController < ApplicationController
  before_action :set_menu, except: [:index, :create]

  def index
    render json: Menu.all
  end

  def show
    menu = { menu: { name: @menu.name}, menu_items: @menu.menu_items }
    render json: menu
  end

  def create
    @menu = Menu.create(menu_params)
    if @menu.save
      render json: @menu
    else
      render json: { errors: @menu.errors }, status: 401
    end
  end

  def update
    if @menu.update(menu_params)
      render json: @menu
    else
      render json: { errors: @menu.errors }, status: 401
    end
  end

  def destroy
    @menu.destroy
  end

  private
    def menu_params
      params.require(:menu).permit(:name)
    end

    def set_menu
      @menu = Menu.find(params[:id])
    end
end
