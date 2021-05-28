class AddEventDateToevents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :Event_Date, :Date
  end
end
