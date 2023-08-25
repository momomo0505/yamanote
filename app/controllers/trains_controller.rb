class TrainsController < ApplicationController
  def index

    @trains = Train.all
  end

    @number_of_trains = 11
    @trains = Train.limit(@number_of_trains)


  end


