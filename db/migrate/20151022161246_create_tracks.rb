class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :name, null: false
      t.string :bonus_or_regular, null: false
      t.text :lyrics

      t.timestamps
    end

    add_index :tracks, :album_id


    change_column_null :bands, :name, false
    change_column_null :users, :email, false
    change_column_null :users, :password_digest, false
    change_column_null :users, :session_token, false
  end
end
