class AddAccountToDomains < ActiveRecord::Migration
  def change
  	add_column :domains, :account_id, :integer
    add_index :domains, :account_id
  end
end