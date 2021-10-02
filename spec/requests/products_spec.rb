# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  include AppHelper
  context 'GET API' do
    describe 'return success' do
      it 'get product detail' do
        get "/api/products/#{product.id}", headers: headers
        expect(response).to have_http_status(200)
        expect(response.body).to_not be_empty
      end
    end

    describe 'return failed' do
      it 'get product detail' do
        get '/api/products/12', headers: headers
        expect(response).to have_http_status(500)
      end
    end
  end

  context 'POST API' do
    let(:valid_params) { product_valid_params }
    let(:invalid_params) { product_invalid_params }

    describe 'return success' do
      it 'post using valid params' do
        post '/api/products', params: valid_params, headers: headers
        expect(response).to have_http_status(201)
      end
    end

    describe 'return failed' do
      it 'post using invalid params' do
        post '/api/products', params: invalid_params, headers: headers
        expect(response).to have_http_status(422)
      end
    end
  end

  context 'PUT API' do
    let(:valid_params) { { product: { name: 'userPut', price: 120_000 } } }
    let(:invalid_params) { { product: { price: nil } } }

    describe 'return success' do
      it 'using valid params' do
        put "/api/products/#{product.id}", params: valid_params, headers: headers
        expect(response).to have_http_status(200)
      end
    end

    describe 'return failed' do
      it 'using invalid params' do
        put "/api/products/#{product.id}", params: invalid_params, headers: headers
        expect(response).to have_http_status(422)
      end

      it 'product does not exist' do
        put '/api/products/12', params: invalid_params, headers: headers
        expect(response).to have_http_status(500)
      end
    end
  end

  context 'DELETE API' do
    describe 'return success' do
      it 'using valid params' do
        delete "/api/products/#{product.id}", headers: headers
        expect(response).to have_http_status(200)
      end
    end

    describe 'return failed' do
      it 'product does not exist' do
        delete '/api/products/12', headers: headers
        expect(response).to have_http_status(500)
      end
    end
  end
end
