class CreateTvShows < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_shows do |t|
      t.string :title
      t.string :network
      t.string :rate
      t.string :time

      t.timestamps
    end
  end
end
