class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
    	t.belongs_to :user
    	t.belongs_to :article
      t.timestamps
    end
  end
end
