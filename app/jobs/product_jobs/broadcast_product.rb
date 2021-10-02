# frozen_string_literal: true

module ProductJobs
  # BroadcastProduct
  class BroadcastProduct < ApplicationJob
    queue_as :default

    def perform(product)
      payload = {
        id: product.id,
        name: product.name,
        price: product.price,
        category: product.category,
        is_active: product.is_active,
        created_at: product.created_at
      }
      # puts payload
      ActionCable.server.broadcast('ProductChannel', payload)
    end
  end
end
