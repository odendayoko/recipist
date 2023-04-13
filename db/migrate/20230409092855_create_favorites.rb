class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.timestamps
    end
     add_index :favorites, [:user_id, :menu_id], unique: true
  end
end
