class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.string :report_id

      t.timestamps
    end
  end
end
