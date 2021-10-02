# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true

  has_one_attached :image

  after_create_commit do
    ProductJobs::ProductIsActive
      .set(wait_until: DateTime.now + 3.minutes)
      .perform_later(self)

    ProductJobs::BroadcastProduct.perform_later(self)
  end
end
