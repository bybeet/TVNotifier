class CreateListShows < ActiveRecord::Migration
  def change
    create_table :list_shows do |t|
      t.integer :show_id
      t.integer :user_id

      t.timestamps
    end
  end
end
