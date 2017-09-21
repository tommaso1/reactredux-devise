class AddUserIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :user_id, :integer, index: true
  end
end
