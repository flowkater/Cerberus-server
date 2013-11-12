class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :act_type
      t.string :view
      t.string :param
      t.integer :sleep
      t.integer :parent_id
      t.references :scenario

      t.timestamps
    end
    add_index :records, :scenario_id
  end
end
