class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  # Add default_scope to both TodoList and TodoItem models
  #to always return collectons from the database ordered by
  # due dates with earliest dates first.

  default_scope { order :due_date }
  scope :completed_todos, -> { where(completed: true) }
end
