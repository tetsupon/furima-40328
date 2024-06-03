class BuyerForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :shipping_area_id, :municipality, :street_address, :building_name, :phone_number

  with_options presence: true do
    # buyerモデルのバリデーション
    validates :item_id
    validates :user_id
    # addressモデルのバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end
  def save(params,user_id)
    buyer = Buyer.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end