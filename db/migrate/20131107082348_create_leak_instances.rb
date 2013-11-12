class CreateLeakInstances < ActiveRecord::Migration
  def change
    create_table :leak_instances do |t|
      t.string :instancename
      t.string :instanceid
      t.float :size
      t.float :leak_suspect
      t.integer :parent_id
      t.references :memory

      t.timestamps
    end
    add_index :leak_instances, :memory_id
  end
end
