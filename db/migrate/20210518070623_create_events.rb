class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :Date_number
      t.boolean :Event_type
      t.text :content

      t.timestamps
    end
  end
end
