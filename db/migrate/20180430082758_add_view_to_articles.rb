class AddViewToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :views, :integer, default: 0
  end
end
