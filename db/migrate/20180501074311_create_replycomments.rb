class CreateReplycomments < ActiveRecord::Migration[5.2]
  def change
    create_table :replycomments do |t|
    	t.belongs_to :user
    	t.belongs_to :comment
      t.timestamps
    end
  end
end
