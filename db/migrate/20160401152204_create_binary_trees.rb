class CreateBinaryTrees < ActiveRecord::Migration
  def change
    create_table :binary_trees do |t|

      t.timestamps null: false
    end
  end
end
