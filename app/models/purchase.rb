class Purchase
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :street_address
    validates :telephone_number
    validates :token
    validates :user_id
    validates :item_id
  end
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, telephone_number: telephone_number, building_name: building_name, order_id: order.id)
  end
end
