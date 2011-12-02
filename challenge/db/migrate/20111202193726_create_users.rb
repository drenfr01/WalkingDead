class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
