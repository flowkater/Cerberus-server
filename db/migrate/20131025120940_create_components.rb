class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.float :cpu
      t.float :threeg
      t.float :wifi
      t.float :gps
      t.float :audio
      t.integer :begin
      t.references :battery

      t.timestamps
    end
    add_index :components, :battery_id
  end
end
