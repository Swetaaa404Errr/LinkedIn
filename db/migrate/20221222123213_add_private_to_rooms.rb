class AddPrivateToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :private, :boolean, default: false
  end
end
