class AddTitleAndBodyToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :title, :string
    add_column :articles, :body, :string
  end
end
