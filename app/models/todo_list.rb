class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, dependent: :destroy
  # Add default_scope to both TodoList and TodoItem models to always return collectons from the database ordered by

  # due dates with earliest dates first.
  default_scope { order :list_due_date }
end
