class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :buyer,         null: false, foreign_key: true
      t.string     :post_code,      null: false
      t.integer    :shipping_area_id, null: false
      t.string     :municipality,          null: false
      t.string     :street_address,         null: false
      t.string     :building_name
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
