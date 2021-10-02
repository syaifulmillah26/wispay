# frozen_string_literal: true

# This file was sending an email
require 'rails_helper'
RSpec.describe ProductJobs::BroadcastProduct, type: :job do
  include AppHelper

  describe '#perform' do
    it 'Brodcasting Product' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        ProductJobs::BroadcastProduct.perform_later(product)
      end.to have_enqueued_job(ProductJobs::BroadcastProduct).at_least(2).times
    end
  end
end
