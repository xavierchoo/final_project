class CreateBbcs < ActiveRecord::Migration[5.2]
  def change
    create_table :bbcs do |t|
    	t.string :url
      t.timestamps
    end
  end
end
