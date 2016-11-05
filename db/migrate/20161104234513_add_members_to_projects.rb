class AddMembersToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :members, :text
  end
end
