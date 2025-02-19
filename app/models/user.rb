class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items
  validates :username, length: { minimum: 2 }, presence: true
  has_secure_password
  # of TodoItems associated with a specific User where
  # completed:true)



  def get_completed_count
    todo_items.where(completed: true).count
  end
end
