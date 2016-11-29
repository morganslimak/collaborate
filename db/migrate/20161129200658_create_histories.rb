class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.string :history
      t.references :projects

      t.timestamps
    end
  end
end
