class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.integer :from_user_id, null: false
      t.integer :to_user_id, null: false
      t.text :title, null: false
      t.text :purpose, null: false
      t.text :background, null: false
      t.text :body, null: false
      t.integer :progress_status, null: false, default: "0"
      t.timestamps
    end
  end
end
