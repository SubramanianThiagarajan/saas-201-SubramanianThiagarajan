class AddAdminPasswordToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :admin_password, :string
  end
end
