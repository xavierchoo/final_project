class CreateCommentIds < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_ids do |t|
    	t.integer :id_key
      t.timestamps
    end
  end
end
