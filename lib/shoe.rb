class Shoe < ActiveRecord::Base
  has_many :records
  has_many :stores, through: :records
  validates(:brand, :presence => true)
  validates(:brand, uniqueness: { case_sensitive: false })
  validates :brand, length: { maximum: 100 }
  before_save(:titlecase_brand)

private
  def titlecase_brand
    self.brand=(brand.titlecase)
  end

  # def currency_price
  #   self.price=(price.currency)
  # end
end
