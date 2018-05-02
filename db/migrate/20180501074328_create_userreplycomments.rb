class CreateUserreplycomments < ActiveRecord::Migration[5.2]
  def change
    create_table :userreplycomments do |t|
    	t.belongs_to :user
    	t.belongs_to :comment
      t.timestamps
    end
  end
end
