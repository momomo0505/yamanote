module TrainsHelper
  def left_value_for(seat_number)
    # ここで席番号に応じて左の値を計算して返す
    [0, 0, 0, 78, 78, 78][seat_number - 1]
  end

  def top_value_for(seat_number)
    # ここで席番号に応じて上の値を計算して返す
    [27, 50, 73, 27, 50, 73][seat_number - 1]
  end
end