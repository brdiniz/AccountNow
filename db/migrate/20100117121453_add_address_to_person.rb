class AddAddressToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :address, :string
  end

  def self.down
    remove_column :people, :address
  end
end

