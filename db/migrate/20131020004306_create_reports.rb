class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.float :appversion
      t.integer :project_id
      t.integer :scenario_id

      t.timestamps
    end
  end
end
