class AddCompletedToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :completed, :boolean
  end
end
