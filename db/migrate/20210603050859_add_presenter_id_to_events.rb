class AddPresenterIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :presenter_id, :integer
  end
end
