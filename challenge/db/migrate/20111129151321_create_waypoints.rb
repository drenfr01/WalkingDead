class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.references :geo_challenge
      t.decimal :lat, :precision => 10, :scale => 6
      t.decimal :lng, :precision => 10, :scale => 6

      t.timestamps
    end
  end
end
