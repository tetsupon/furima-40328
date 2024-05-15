class Item < ApplicationRecord
  belongs_to :user

  # active_storageとのアソシエーション（items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image
end
