class CreatePlannings < ActiveRecord::Migration[6.1]
  def change
    create_table :plannings do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :datenum
      t.string :strdate
      t.integer :status

      t.timestamps
    end
  end
end
