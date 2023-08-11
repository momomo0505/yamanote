class UsersController < ApplicationController
  RADIUS = 0.1 # 100m以内のユーザーを検索

  def nearby_users
    @users = User.where("ST_Distance_Sphere(point(longitude, latitude), point(?, ?)) < ?", params[:lon], params[:lat], RADIUS * 1000)
    render json: @users
  end
end