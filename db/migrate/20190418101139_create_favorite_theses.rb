class CreateFavoriteTheses < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_theses do |t|
      t.string :type
      t.string :title
      t.string :institution
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
