class CreateAdminSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_selections do |t|
      t.references :testing, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
