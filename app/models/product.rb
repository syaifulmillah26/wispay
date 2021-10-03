# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true

  has_one_attached :image, dependent: :destroy

  after_create_commit do
    ProductJobs::ProductIsActive
      .set(wait_until: DateTime.now + 3.minutes)
      .perform_later(self)

    ProductJobs::BroadcastProduct.perform_later(self)
  end

  def self.upload_image_file_by_blog(object, image_file)
    blob = ActiveStorage::Blob.create_after_upload!(
      io: StringIO.new(Base64.decode64(image_file.file.split(',')[1])),
      filename: image_file.filename
    )
    object.image.attach(blob)
  end
end
