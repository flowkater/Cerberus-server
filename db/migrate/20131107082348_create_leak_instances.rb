class CreateLeakInstances < ActiveRecord::Migration
  def change
    create_table :leak_instances do |t|
      t.string :name
      t.references :memory

      t.timestamps
    end
    add_index :leak_instances, :memory_id
  end
end
