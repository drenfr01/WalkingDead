class AddLocationChallengeIdToFeats < ActiveRecord::Migration
  def change
    add_column :feats, :location_challenge_id, :integer
  end
end
