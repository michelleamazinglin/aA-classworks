class AddTimestampsToTables < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:users)
    add_timestamps(:artworks)
  end
end
 