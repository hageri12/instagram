class AddContentToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :content, :string
  end
end
