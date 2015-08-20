class DropMoviesTable < ActiveRecord::Migration
  def up
    drop_table :movies
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
