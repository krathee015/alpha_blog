class AddColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :like, :boolean
    add_column :articles, :dislike, :boolean
    add_column :articles, :comments, :text
  end
end
