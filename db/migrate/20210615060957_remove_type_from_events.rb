class RemoveTypeFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :type, :boolean
  end
end
