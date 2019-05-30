class CreateFavoriteCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_courses do |t|
      t.string :title
      t.text :objective
      t.text :teachingcontent
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
