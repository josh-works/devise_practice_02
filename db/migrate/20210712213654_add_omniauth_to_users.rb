class AddOmniauthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :providor, :string
    add_column :users, :uid, :string
  end
end
