class AddForeignKeyToArticles < ActiveRecord::Migration[7.0]
  def change
    add_index :articles, :user_id
  end
end
