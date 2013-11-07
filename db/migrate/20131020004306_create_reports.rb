class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.float :appversion
      t.float :osversion
      t.integer :project_id, null: false
      t.integer :scenario_id
      t.decimal :time_for_profiling
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
