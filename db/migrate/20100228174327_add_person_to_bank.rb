class AddPersonToBank < ActiveRecord::Migration
  def self.up
    add_column :banks, :person_id, :int
  end

  def self.down
    remove_column :banks, :person_id
  end
end
