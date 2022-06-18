class CreateWorkComments < ActiveRecord::Migration[6.1]
  def change
    create_table :work_comments do |t|
      t.integer :work_id, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end