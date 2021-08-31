class PurchaseTransport
  include ActiveModel::Model
  attr_accessor :post, :prefecture, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Transport.create(post: post, prefecture: prefecture, city: city, address: address, building: building, phone: phone, purchase_id: purchase.id)
  end
end