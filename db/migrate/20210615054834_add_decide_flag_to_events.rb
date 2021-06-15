class AddDecideFlagToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :decide_flag, :integer
  end
end
