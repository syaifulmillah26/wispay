require 'rails_helper'

RSpec.describe ProductMailer, type: :mailer do
  include AppHelper

  describe 'Product Informations' do
    before(:each) do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
    end

    after(:each) do
      ActionMailer::Base.deliveries.clear
    end

    it 'should send an email' do
      ProductMailer.with(object: product).product_created.deliver_now
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'should set the subject correctly' do
      ProductMailer.with(object: product).product_created.deliver_now
      expect(ActionMailer::Base.deliveries.first.subject).to eq('Product Informations')
    end
  end
end
