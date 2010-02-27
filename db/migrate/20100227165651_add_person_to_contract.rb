class AddPersonToContract < ActiveRecord::Migration
  def self.up
    add_column :contracts, :person_idid, :int
  end

  def self.down
    remove_column :contracts, :person_idid
  end
end
