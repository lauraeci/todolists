class ConvertBoolean < ActiveRecord::Migration[5.2]
  def change
    TodoItem.where("completed = 't'").update_all(completed: 1)
  end
end
