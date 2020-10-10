class CreatePigs < ActiveRecord::Migration[6.0]
  def change
    create_table :pigs do |t|
      t.string :name
      t.float :weight
      t.string :highest_medal_achieved
      t.string :img_url
      t.boolean :greased
      t.string :specialty

      t.timestamps
    end
  end
end
