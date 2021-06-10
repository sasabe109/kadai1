class AddFlagToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :flag, :integer
  end
end
