class CreateTraceMethods < ActiveRecord::Migration
  def change
    create_table :trace_methods do |t|
      t.string :name
      t.float :self_time_rate
      t.float :sum_time_rate
      t.integer :call_index
      t.float :usecs
      t.references :cpu

      t.timestamps
    end
    add_index :trace_methods, :cpu_id
  end
end
