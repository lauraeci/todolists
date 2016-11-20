class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todolist do |t|
      t.string :list_name
      t.date :list_due_date
      t.timestamps null: false
    end
     add_reference :todolist, :user, index: true, foreign_key: true
  end
end
