class RenamePersonIdToContract < ActiveRecord::Migration
  def self.up
    remove_column :contracts, :person_idid
    add_column :contracts, :person_id, :int
  end

  def self.down
    remove_column :contracts, :person_id
    add_column :contracts, :person_idid, :int
  end
end

