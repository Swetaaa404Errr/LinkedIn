class AddExistToUserInfs < ActiveRecord::Migration[6.1]
  def change
    add_column :user_infs, :exist, :boolean, default: false
  end
end
