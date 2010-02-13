class AddIdentifierToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :identifier, :string
  end

  def self.down
    remove_column :people, :identifier
  end
end
