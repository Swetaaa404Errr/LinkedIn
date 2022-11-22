class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.references :follower, references: :users
      t.references :following, references: :users
      t.timestamps
    end
     add_index :followers, [:user_id, :created_at]

  end
end
