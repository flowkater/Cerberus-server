class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :tag_name
      t.references :eventpath

      t.timestamps
    end
    add_index :events, :eventpath_id
  end
end
