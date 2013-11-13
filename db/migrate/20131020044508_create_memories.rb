class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :report_id
      t.string :hprof1
      t.string :hprof2

      t.timestamps
    end
  end
end
