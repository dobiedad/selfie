class UserSelfiesController < ApplicationController
  def create
      UserSelfie.create(user_selfie_params)
  end
  def user_selfie_params
   params.require(:user_selfie).permit(:selfie)
 end

 def
   
 end

end
