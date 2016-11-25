class AddStatusesToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :statuses, :string, default: "New"
  end
end
