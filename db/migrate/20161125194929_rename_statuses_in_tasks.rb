class RenameStatusesInTasks < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :statuses, :status
  end
end
