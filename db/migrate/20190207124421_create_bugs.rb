class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.string :issue_type
      t.string :priority
      t.string :status

      t.timestamps
    end
  end
end
