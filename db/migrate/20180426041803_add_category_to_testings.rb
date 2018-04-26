class AddCategoryToTestings < ActiveRecord::Migration[5.2]
  def change
    add_column :testings, :category, :string
  end
end
