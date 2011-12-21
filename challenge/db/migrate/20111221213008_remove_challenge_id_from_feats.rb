class RemoveChallengeIdFromFeats < ActiveRecord::Migration
  def up
    remove_column :feats, :challenge_id
  end

  def down
    add_column :feats, :challenge_id, :integer
  end
end
