class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null:false
      t.string :email, null:false
      t.string :password_digest, null:false

      t.timestamps
    end #don't forget this 3rd end!!
  end
end
