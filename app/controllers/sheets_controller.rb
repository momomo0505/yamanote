class SheetsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :new]
 
   def show
      @sheet = Sheet.find_by(id: params[:id])
      if @sheet.nil?
        # シートがまだ存在しない場合、新しいシートインスタンスを作成
        @sheet = Sheet.new
        render :new  # sheet/new.html.erb をレンダリングする
        return
      end
    end
 
    def new
      @train = Train.find(params[:train_id])
      @sheet = Sheet.new
    end
    
    def create
      @train = Train.find(params[:train_id])
      @sheet = @train.sheets.build(sheet_params)
      @sheet.seller_id = current_user.id  # seller_id に現在のユーザーのIDを設定
      @sheet.buyer_id = nil  # buyer_id は初期状態では設定しない
      # buyer_id は購入時に設定するので、ここでは設定しない
      if @sheet.save
        redirect_to train_sheet_path(@train, @sheet), notice: 'シートを出品しました。'
      else
         logger.error @sheet.errors.full_messages  # ここを追加
        flash.now[:alert] = @sheet.errors.full_messages.join(",入力に不備があります ")
        render :new
      end
    end
    
    def destroy
      @sheet = Sheet.find_by(id: params[:id])
      unless @sheet
        redirect_to root_path, alert: 'シートが見つかりません'
        return
      end
    
      if @sheet.seller_id == current_user.id
        @sheet.destroy
      end
      redirect_to root_path
    end


   def update
     @sheet = Sheet.find_by(id: params[:id])
     unless @sheet
       redirect_to root_path, alert: 'シートが見つかりません'
       return
     end
 
     if @sheet.update(sheet_params)
       redirect_to sheet_path(@sheet), notice: '情報を更新しました。'
     else
       render :show
     end
   end
 
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
 
   private
 
   def sheet_params
     params.require(:sheet).permit(:exit_station, :appearance)
   end
 end
