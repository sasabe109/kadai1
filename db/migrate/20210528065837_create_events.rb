class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.boolean :type
      t.text :content

      t.timestamps
    end
  end
end
