class RemoveTimeFromTvShows < ActiveRecord::Migration[6.0]
  def change

    remove_column :tv_shows, :time, :string
  end
end
