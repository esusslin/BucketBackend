class CreateBuckets < ActiveRecord::Migration[5.1]
  def change
    create_table :buckets do |t|
      t.string :item
      t.float :monthly
      t.float :price
      t.float :months
      t.string :imageString
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
