class CreateUserReplyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reply_comments do |t|

      t.timestamps
    end
  end
end
