class AddUserIdToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :user_id, :integer
  end
end
