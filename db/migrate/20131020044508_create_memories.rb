class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :report_id
      t.string :hprof

      t.timestamps
    end
  end
end
