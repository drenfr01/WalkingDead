class CreateLocationChallenges < ActiveRecord::Migration
  def change
    create_table :location_challenges do |t|
      t.integer :challenge_id
      t.string :title
      t.text :description
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
