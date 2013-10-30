class CreateLatencyMethods < ActiveRecord::Migration
  def change
    create_table :latency_methods do |t|
      t.float :latency
      t.string :name
      t.string :class_name
      t.integer :line_number
      t.string :request_url
      t.references :network

      t.timestamps
    end
    add_index :latency_methods, :network_id
  end
end
