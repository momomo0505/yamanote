class TrainsController < ApplicationController
  
  def index

    @train = Train.find_by(id: 1)
    @sheets = @train.sheets.pluck(:seat_number)  # このトレインに関連するシートの席番号を配列として取得
    unless @train
      # 何らかの処理（例：エラーメッセージを表示してトップページへリダイレクトする）
      redirect_to root_path, alert: 'Train not found'
    end
  end

end
