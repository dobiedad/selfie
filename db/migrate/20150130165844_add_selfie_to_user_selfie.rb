class AddSelfieToUserSelfie < ActiveRecord::Migration
  def self.up
    add_attachment :user_selfies, :selfie
  end

  def self.down
    remove_attachment :user_selfies, :selfie
  end
end
