class TrainsController < ApplicationController
  
  def index
    @number_of_trains = 11
    @trains = Train.limit(@number_of_trains)


  end

end