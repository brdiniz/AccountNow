class AddSituationAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :situation_id, :int
  end

  def self.down
    remove_column :acconts, :situation_id
  end
end

