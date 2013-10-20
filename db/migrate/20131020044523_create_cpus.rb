class CreateCpus < ActiveRecord::Migration
  def change
    create_table :cpus do |t|
      t.string :report_id

      t.timestamps
    end
  end
end
