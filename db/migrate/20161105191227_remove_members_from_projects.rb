class RemoveMembersFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :members
  end
end
