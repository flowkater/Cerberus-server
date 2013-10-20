class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :report_id

      t.timestamps
    end
  end
end
