class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
    	t.string :name
    	t.string :description
    	t.string :link
    	t.string :image
    	t.boolean :published, default: false
    	 
      t.timestamps
    end
  end
end
