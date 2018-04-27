class CreateWelcomeIndices < ActiveRecord::Migration[5.2]
  def change
    create_table :welcome_indices do |t|
    	t.references :article, foreign_key: true
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
