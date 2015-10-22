class ChangeTitleColumnNullStatus < ActiveRecord::Migration
  def change
    change_column_null :albums, :title, false
  end
end
