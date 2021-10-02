# frozen_string_literal: true

# This file was sending an email
require 'rails_helper'
RSpec.describe ProductJobs::ProductIsActive, type: :job do
  include AppHelper

  describe '#perform after 3 minutes' do
    it 'Notif product is active' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        ProductJobs::ProductIsActive
          .set(wait_until: DateTime.now + 3.minutes)
          .perform_later(product)
      end.to have_enqueued_job(ProductJobs::ProductIsActive).at_least(2).times
    end
  end
end
