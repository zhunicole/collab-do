class AddAdminToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :admin, :boolean, :default => false
  end

  def change
    add_column :users, :admin, :boolean, :default => false
  end

  def self.down
  	remove_column :users, :admin 
  end
end


# if current_user.admin?
	# if no curr user , then do: current_user.try?(:admin?)

# granting admin status
	# current_user.update_attribute :admin, true