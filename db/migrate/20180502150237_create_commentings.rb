class CreateCommentings < ActiveRecord::Migration[5.2]
  def change
    create_table :commentings do |t|
      t.string :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
