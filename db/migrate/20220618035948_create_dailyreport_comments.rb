class CreateDailyreportComments < ActiveRecord::Migration[6.1]
  def change
    create_table :dailyreport_comments do |t|
      t.integer :dailyreport_id, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end