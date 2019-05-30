class CreateFavoriteProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_projects do |t|
      t.string :title
      t.string :form
      t.string :abstract
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
