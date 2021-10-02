# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  include AppHelper
  context 'Validation Model' do
    it 'ensure user presence' do
      product = Product.new(
        user_id: nil,
        name: 'T-Shirt',
        price: 120_000,
        category: 'minuman'
      ).save
      expect(product).to eq(false)
    end

    it 'ensure name presence' do
      product = Product.new(
        user_id: current_user.id,
        name: nil,
        price: 120_000,
        category: 'minuman'
      ).save
      expect(product).to eq(false)
    end

    it 'ensure price presence' do
      product = Product.new(
        name: 'T-shirt',
        price: nil,
        category: 'minuman'
      ).save
      expect(product).to eq(false)
    end

    it 'ensure category presense' do
      product = Product.new(
        name: 'T-shirt',
        price: 120_000,
        category: nil
      ).save
      expect(product).to eq(false)
    end

    it 'should have successfully created' do
      product = Product.new(
        user_id: current_user.id,
        name: 'T-shirt',
        price: 120_000,
        category: 'Minuman'
      ).save!
      expect(product).to eq(true)
    end
  end
end
