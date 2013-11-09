class CreateCpus < ActiveRecord::Migration
  def change
    create_table :cpus do |t|
      t.string :report_id
      t.string :trace

      t.timestamps
    end
  end
end
