class ChangeRefsForHistories < ActiveRecord::Migration[5.0]
  def change
    remove_reference :histories, :projects
    add_reference :histories, :project, foreign_key: true
  end
end
