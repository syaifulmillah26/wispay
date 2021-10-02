class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :is_active, :image_url, :created_at

  def image_url
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
