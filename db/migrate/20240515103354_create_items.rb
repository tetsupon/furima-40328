class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :product_name,         null: false
      t.text       :product_description,  null: false
      t.integer    :product_category_id,  null: false
      t.integer    :product_condition_id, null: false
      t.integer    :delivery_charge_id,   null: false
      t.integer    :shipping_area_id,     null: false
      t.integer    :shipping_day_id,      null: false
      t.integer    :price,                null: false

      t.timestamps
    end
  end
end
