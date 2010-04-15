class RemoveDefaultStateValueFromPresentations < ActiveRecord::Migration
  def self.up
    change_column_default :presentations, :state, nil
  end

  def self.down
    change_column_default :presentations, :state, "idea"
  end
end

