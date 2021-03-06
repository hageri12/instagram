class AddOmniatuthColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :string, null:false, default:""
    add_column :users, :provider, :string, null:false, default:""
    add_column :users, :image_url, :string

    add_index :users,[:uid, :provider], unique: true
  end
end
