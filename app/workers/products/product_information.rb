# frozen_string_literal: true

module Products
  # Product Information
  class ProductInformation
    include Sidekiq::Worker
    sidekiq_options retry: false
    sidekiq_options queue: :default

    def perform(product_id)
      product = Product.find_by_id(product_id)
      product.update_column(:is_active, true)

      puts 'sending email product created'
      ProductMailer.with(object: product).product_created.deliver
    end
  end
end
