class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :act_type
      t.string :view
      t.integer :param
      t.references :scenario

      t.timestamps
    end
    add_index :records, :scenario_id
  end
end
