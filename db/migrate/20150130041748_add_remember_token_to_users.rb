
class AddRememberTokenToUsers < ActiveRecord::Migration
# token will be stored as a cookie and used later to authenticate users

  def change
    add_column :users, :remember_token, :string
    add_index  :users, :remember_token
  end
end
