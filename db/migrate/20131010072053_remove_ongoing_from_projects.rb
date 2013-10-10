class RemoveOngoingFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :ongoing
  end
end
