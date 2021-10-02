# frozen_string_literal: true

module ProductJobs
  # ProductIsActive
  class ProductIsActive < ApplicationJob
    include MailHelper
    queue_as :default

    def perform(product)
      product.update_column(:is_active, true)
      send_mail_product_information(product)
    end
  end
end
