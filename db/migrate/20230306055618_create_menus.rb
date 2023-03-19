class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :url
      t.text :memo
      t.timestamps
    end
  end
end
