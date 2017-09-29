class Store < ActiveRecord::Base
  has_many :records
  has_many :shoes, through: :records
  validates(:item, :presence => true)
  validates(:item, uniqueness: { case_sensitive: false })
  before_save(:titlecase_name)

private
  def titlecase_name
    self.name=(name.titlecase)
  end
end
