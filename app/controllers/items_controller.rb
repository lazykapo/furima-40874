class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def image_params
    params.require(:image).permit(:content, :image).merge(user_id: current_user.id)
  end
end
