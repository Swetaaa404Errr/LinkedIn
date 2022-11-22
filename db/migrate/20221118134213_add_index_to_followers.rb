class AddIndexToFollowers < ActiveRecord::Migration[6.1]
  def change

    add_index :followers, :user_id


  end
end

