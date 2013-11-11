class CreateTraceMethods < ActiveRecord::Migration
  def change
    create_table :trace_methods do |t|
      t.string :methodName
      t.integer :index
      t.float :total
      t.float :self
      t.integer :calls
      t.float :excl
      t.integer :parent_id
      t.references :cpu

      t.timestamps
    end
    add_index :trace_methods, :cpu_id
  end
end
