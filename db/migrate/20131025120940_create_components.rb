class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.float :joule
      t.references :battery

      t.timestamps
    end
    add_index :components, :battery_id
  end
end
