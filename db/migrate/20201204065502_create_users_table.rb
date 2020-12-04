class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest 
      #We're using password_digest because we're 
      # utilizing bcrypt to encrypt the passwords
    end
  end
end
