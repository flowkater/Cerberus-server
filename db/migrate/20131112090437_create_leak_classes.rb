class CreateLeakClasses < ActiveRecord::Migration
  def change
    create_table :leak_classes do |t|
      t.string :classname
      t.integer :differencecnt
      t.integer :totalsize
      t.references :memory

      t.timestamps
    end
    add_index :leak_classes, :memory_id
  end
end
