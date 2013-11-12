class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :report_id

      t.timestamps
    end
  end
end
