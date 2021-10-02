# frozen_string_literal: true

# This file was sending an email
require 'rails_helper'
RSpec.describe DeviseMailer, type: :mailer do
  include AppHelper

  describe 'notify' do
    before(:each) do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
    end

    after(:each) do
      ActionMailer::Base.deliveries.clear
    end

    context 'reset password instructions' do
      it 'should not proceed if email is empty' do
        mail = DeviseMailer.with(object: invalid_user_mail).reset_password_instructions
        expect { raise mail.deliver_now }.to raise_error(ArgumentError)
      end

      it 'should send an email' do
        DeviseMailer.with(object: user).reset_password_instructions.deliver_now
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end

      it 'sends to the correct receiver' do
        DeviseMailer.with(object: user).reset_password_instructions.deliver_now
        expect(ActionMailer::Base.deliveries.first.to.first).to eq('saiful@gmail.com')
      end

      it 'should set the subject correctly' do
        DeviseMailer.with(object: user).reset_password_instructions.deliver_now
        expect(ActionMailer::Base.deliveries.first.subject).to eq('Reset Password Instructions')
      end
    end

    context 'Product Informations' do
      it 'should send an email' do
        DeviseMailer.with(object: product).product_informations.deliver_now
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end

      it 'should set the subject correctly' do
        DeviseMailer.with(object: product).product_informations.deliver_now
        expect(ActionMailer::Base.deliveries.first.subject).to eq('Product Informations')
      end
    end
  end
end
