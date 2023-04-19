class Item < ApplicationRecord

  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  belongs_to :category
  has_many :order_items, dependent: :destroy


  enum sale_status: { 売り切れ: 0, 販売中: 1 }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
