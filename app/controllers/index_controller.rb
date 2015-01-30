class IndexController < ApplicationController
  before_action :authenticate_user!
  def home
    @user_selfie=UserSelfie.new
  end

end
