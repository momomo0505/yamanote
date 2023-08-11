class SheetsController < ApplicationController
   def purchase
     @seat = Seat.find_by(id: params[:id])
     unless @seat
       redirect_to root_path, alert: '席が見つかりません'
       return
     end
     if @seat.status == "available"
        @seat.update(user_id: current_user.id, status: "purchased")
        redirect_to @seat, notice: '席を購入しました。'
     else
        redirect_to @seat, alert: '席は既に購入されています。'
     end
   end
 end