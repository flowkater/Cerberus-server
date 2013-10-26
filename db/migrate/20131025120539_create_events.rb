class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :tag_name
      t.references :project

      t.timestamps
    end
    add_index :events, :project_id
  end
end
