class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :app_icon
      t.string :appversion
      t.string :osversion
      t.integer :project_id, null: false
      t.integer :scenario_id
      t.decimal :time_for_profiling
      t.boolean :completed, default: false
      t.boolean :scenario_test
      t.boolean :error_status, default: false
      t.boolean :memory_checked
      t.boolean :cpu_checked
      t.boolean :network_checked
      t.boolean :battery_checked

      t.timestamps
    end
  end
end
