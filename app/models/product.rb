class Product < ActiveRecord::Base
  attr_accessible :sku, :name, :price, :category, :unit, :photo

has_attached_file :photo, :styles => { :medium => "150x150>" }, 
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    default_url: "/assets/missing.jpg", 
    path: "upload/:class/:attachment/:style/:filename"

end