class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :index
      t.string :event
      t.integer :size
      t.integer :parent_id
      t.references :eventpath

      t.timestamps
    end
    add_index :events, :eventpath_id
  end
end
