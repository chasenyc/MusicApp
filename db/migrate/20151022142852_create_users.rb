class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, presence: true, uniqueness: true
      t.string :password_digest, presence: true
      t.string :session_token, presence: true

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :session_token
  end
end
