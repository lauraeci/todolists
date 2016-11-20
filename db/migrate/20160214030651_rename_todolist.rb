class RenameTodolist < ActiveRecord::Migration
  def change
    rename_table :todolist, :todo_lists
  end
end
