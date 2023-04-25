class Address < ApplicationRecord
  belongs_to :customer

  def address_display
   '〒' + postcode + ' ' + address + ' ' + name
  end
  
  validates :address, presence: true
  validates :postcode, presence: true, length: { minimum: 0, maximum: 7 }
  validates :name, presence: true
  
end
