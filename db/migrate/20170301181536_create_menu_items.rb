class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.belongs_to :menu

      t.timestamps
    end
  end
end
