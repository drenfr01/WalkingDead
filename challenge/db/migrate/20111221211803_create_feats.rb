class CreateFeats < ActiveRecord::Migration
  def change
    create_table :feats do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.boolean :complete

      t.timestamps
    end
  end
end
