class Item < ApplicationRecord
  belongs_to :user

  # active_storageとのアソシエーション（items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :product_category
  belongs_to :product_condition
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  
end
