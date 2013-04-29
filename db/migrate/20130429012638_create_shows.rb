class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.text :description
      t.integer :show_id

      t.timestamps
    end
  end
end
