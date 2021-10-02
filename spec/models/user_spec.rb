# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation Model' do
    it 'ensure name presence' do
      user = User.new(
        name: nil,
        email: 'testname@gmail.com',
        password: '111111',
        password_confirmation: '111111'
      ).save
      expect(user).to eq(false)
    end

    it 'ensure email presence' do
      user = User.new(
        name: 'userTest',
        email: nil,
        password: '111111',
        password_confirmation: '111111'
      ).save
      expect(user).to eq(false)
    end

    it 'ensure password presense' do
      user = User.new(
        name: 'userTest',
        email: 'testPhone@gmail.com',
        password: nil,
        password_confirmation: '111111'
      ).save
      expect(user).to eq(false)
    end

    it 'ensure password and password confirmation match' do
      user = User.new(
        name: 'userTest',
        email: 'testPhone@gmail.com',
        password: '11111',
        password_confirmation: '111111'
      ).save
      expect(user).to eq(false)
    end

    it 'should have successfully created' do
      user = User.new(
        name: 'userTest',
        email: 'testPhone@gmail.com',
        password: '111111',
        password_confirmation: '111111'
      ).save
      expect(user).to eq(true)
    end
  end
end
