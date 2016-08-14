class AddNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :member, :string
    add_column :users, :profile, :text
    add_column :users, :works, :string
    add_column :users, :avatar, :string
  end
end
