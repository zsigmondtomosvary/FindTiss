class CreateFavoritePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_people do |t|
      t.string :firstname
      t.string :lastname
      t.string :title
      t.string :email
      t.string :phonenumber
      t.integer :user_id

      t.timestamps
    end
  end
end
