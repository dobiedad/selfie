class CreateUserSelfies < ActiveRecord::Migration
  def change
    create_table :user_selfies do |t|

      t.timestamps
    end
  end
end
