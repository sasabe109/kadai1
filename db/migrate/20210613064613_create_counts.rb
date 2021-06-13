class CreateCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :counts do |t|
      t.integer :event_id
      t.integer :datenum
      t.integer :user_count

      t.timestamps
    end
  end
end
