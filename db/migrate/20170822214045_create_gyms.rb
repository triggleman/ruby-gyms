class CreateGyms < ActiveRecord::Migration[5.1]
  def change
    create_table :gyms do |t|
      t.string :formatted_address
      t.string :geometry
      t.string :name
      t.integer :rating
      t.belongs_to :user, index: true
    end
  end
end
