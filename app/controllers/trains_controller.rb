class TrainsController < ApplicationController
  
  def index
    @train = Train.find_by(id: 1)
    unless @train
      # 何らかの処理（例：エラーメッセージを表示してトップページへリダイレクトする）
      redirect_to root_path, alert: 'Train not found'
    end
  end

end
