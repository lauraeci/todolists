class ChangeTodoItems < ActiveRecord::Migration
  def change
    remove_index :todo_items, :todolist_id
    remove_column :todo_items, :todolist_id
  end
end
