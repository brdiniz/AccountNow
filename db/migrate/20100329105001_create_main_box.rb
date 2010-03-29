class CreateMainBox < ActiveRecord::Migration
  def self.up
    Box.create!(:name => "Principal")
  end

  def self.down
    Box.destroy_all
  end
end
