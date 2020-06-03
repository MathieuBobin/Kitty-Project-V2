class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  
  has_one_attached :image
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_one_attached :image

  def my_url
    rails_blob_path(item.images, disposition: "attachment")
  end

end