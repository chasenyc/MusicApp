class AddColumnToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :title, :string
  end
end
