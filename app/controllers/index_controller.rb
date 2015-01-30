class IndexController < ApplicationController
  before_action :authenticate_user!
  def home
    @user_selfie=UserSelfie.new
    @leaderboard_selfies=UserSelfie.all
  end


end
