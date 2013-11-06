class CreateEventpaths < ActiveRecord::Migration
  def change
    create_table :eventpaths do |t|

      t.timestamps
    end
  end
end
