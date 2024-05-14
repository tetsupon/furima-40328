class ChangeBirthDayDataTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :birth_day, :date
  end
end
