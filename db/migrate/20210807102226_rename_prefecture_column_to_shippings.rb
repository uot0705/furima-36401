class RenamePrefectureColumnToShippings < ActiveRecord::Migration[6.0]
  def change
    rename_column :shippings, :prefecture, :prefecture_id
  end
end
