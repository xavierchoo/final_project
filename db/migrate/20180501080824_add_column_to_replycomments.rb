class AddColumnToReplycomments < ActiveRecord::Migration[5.2]
  def change
  	add_column :replycomments, :description, :string
  end
end
