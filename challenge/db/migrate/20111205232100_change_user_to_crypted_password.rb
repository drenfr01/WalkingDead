class ChangeUserToCryptedPassword < ActiveRecord::Migration
  def change
    change_table :users do |t|
        t.rename :password, :crypted_password
    end
  end
end
