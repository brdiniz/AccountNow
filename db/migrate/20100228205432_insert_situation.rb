class InsertSituation < ActiveRecord::Migration
  def self.up
    Situation.create(:id => 1, :name => "Cancelada")
    Situation.create(:id => 2, :name => "Realizada")
  end

  def self.down
    Situation.destroy_all
  end
end

