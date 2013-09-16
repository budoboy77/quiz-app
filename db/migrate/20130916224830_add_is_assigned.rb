class AddIsAssigned < ActiveRecord::Migration
  def change
  	add_column :assignments, :is_assigned, :boolean, default: false
  end
end
