class AddViewsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :views, :integer
  end
end
