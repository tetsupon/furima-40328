class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_category
  
  belongs_to :user
  has_one :buyer

  # active_storageとのアソシエーション（items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  
  with_options presence: true do
    validates :image
    validates :product_name 
    validates :product_description
    validates :product_category_id
    validates :product_condition_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :product_category_id
    validates :product_condition_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
