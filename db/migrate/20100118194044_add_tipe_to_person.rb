class AddTipeToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :tipe, :string
  end

  def self.down
    remove_column :people, :tipe
  end
end
