class CreateGeoChallenges < ActiveRecord::Migration
  def change
    create_table :geo_challenges do |t|
      t.references :user
      t.boolean :completed

      t.timestamps
    end
  end
end
