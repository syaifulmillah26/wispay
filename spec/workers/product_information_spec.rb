# frozen_string_literal: true

require 'rails_helper' # include in your RSpec file

RSpec.describe Products::ProductInformation, type: :worker do
  include AppHelper

  let(:scheduled_job) { Products::ProductInformation.perform_in(3.minutes, product.id, true) }
  describe 'testing worker' do
    it 'Products::ProductInformation jobs are enqueued in the default queue' do
      described_class.perform_async
      assert_equal :default, described_class.queue
    end

    it 'occurs at expected time' do # define within a describe block
      scheduled_job
      assert_equal true, described_class.jobs.last['jid'].include?(scheduled_job)
      expect(described_class).to have_enqueued_sidekiq_job(product.id, true)
    end
  end
end
