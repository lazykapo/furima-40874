class OrdersController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order_delivery = OrderDelivery.new
  end

  def create
  end
end