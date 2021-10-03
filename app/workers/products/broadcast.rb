# frozen_string_literal: true

module Products
  # Broadcasting Products
  class Broadcast
    include Sidekiq::Worker
    sidekiq_options retry: false
    sidekiq_options queue: :default

    def perform(product_id)
      @product = Product.find_by_id(product_id)

      puts 'start broadcasting'
      ActionCable.server.broadcast('ProductChannel', payload)
    end

    protected

    def payload
      {
        id: @product.id,
        name: @product.name,
        price: @product.price,
        category: @product.category,
        is_active: @product.is_active,
        created_at: @product.created_at
      }
    end
  end
end
