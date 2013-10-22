class Product < ActiveRecord::Base
  attr_accessible :sku, :name, :price, :category, :unit, :photo, :quantity, :description

  has_many :suppliers, :through => :supplier_products
  has_many :line_items, dependent: :destroy
	before_create :generate_token

	has_attached_file :photo, :styles => { :medium => "180x180>" }, 
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    default_url: "/assets/missing.jpg", 
    path: "upload/:class/:attachment/:style/:filename"

  protected

  def generate_token
    self.sku = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Product.where(sku: random_token).exists?
    end
  end
end