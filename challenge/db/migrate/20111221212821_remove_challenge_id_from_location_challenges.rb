class RemoveChallengeIdFromLocationChallenges < ActiveRecord::Migration
  def up
    remove_column :location_challenges, :challenge_id
  end

  def down
    add_column :location_challenges, :challenge_id, :integer
  end
end
