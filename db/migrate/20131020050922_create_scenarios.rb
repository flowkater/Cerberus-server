class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.string :name
      t.string :description
      t.references :project

      t.timestamps
    end
    add_index :scenarios, :project_id
  end
end
