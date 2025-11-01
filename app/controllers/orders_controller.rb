class OrdersController < ApplicationController
  def new

    @sheet = Sheet.find_by(id: params[:sheet_id])
  end
end