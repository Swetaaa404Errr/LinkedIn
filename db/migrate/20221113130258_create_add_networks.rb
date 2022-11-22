class CreateAddNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :add_networks do |t|

      t.timestamps
    end
  end
end
