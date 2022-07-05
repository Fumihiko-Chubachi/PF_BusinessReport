class AddImpressionToDailyreports < ActiveRecord::Migration[6.1]
  def change
    add_column :dailyreports, :impression, :text
  end
end
