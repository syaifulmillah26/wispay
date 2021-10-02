# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include AppHelper
  context 'GET API' do
    describe 'return success' do
      it 'get user detail' do
        get "/api/users/#{user.id}", headers: headers
        expect(response).to have_http_status(200)
        expect(response.body).to_not be_empty
      end
    end

    describe 'return failed' do
      it 'get user detail' do
        get '/api/users/12', headers: headers
        expect(response).to have_http_status(500)
      end
    end
  end

  context 'POST API' do
    let(:valid_params) { user_valid_params }
    let(:invalid_params) { user_invalid_params }

    describe 'return success' do
      it 'post using valid params' do
        post '/api/users', params: valid_params
        expect(response).to have_http_status(201)
      end
    end

    describe 'return failed' do
      it 'post using invalid params' do
        post '/api/users', params: invalid_params
        expect(response).to have_http_status(422)
      end
    end
  end

  context 'PUT API' do
    let(:valid_params) { { user: { name: 'userPut', password: '111111' } } }
    let(:invalid_params) { { user: { email: 'saiful#rubyh' } } }

    describe 'return success' do
      it 'using valid params' do
        put "/api/users/#{user.id}", params: valid_params, headers: headers
        expect(response).to have_http_status(200)
      end
    end

    describe 'return failed' do
      it 'using invalid params' do
        put "/api/users/#{user.id}", params: invalid_params, headers: headers
        expect(response).to have_http_status(422)
      end

      it 'user does not exist' do
        put '/api/users/12', params: invalid_params, headers: headers
        expect(response).to have_http_status(500)
      end
    end
  end

  context 'DELETE API' do
    describe 'return success' do
      it 'using valid params' do
        delete "/api/users/#{user.id}", headers: headers
        expect(response).to have_http_status(200)
      end
    end

    describe 'return failed' do
      it 'user does not exist' do
        delete '/api/users/12', headers: headers
        expect(response).to have_http_status(500)
      end
    end
  end

  context 'Login' do
    let(:valid_params) { { auth: { email: 'saiful@gmail.com', password: '111111' } } }
    let(:wrong_email) { { auth: { email: 'saiful2@gmail.com', password: '111111' } } }
    let(:wrong_password) { { auth: { email: 'saiful2@gmail.com', password: '111111' } } }
    describe 'validations' do
      it 'using wrong email should return failed' do
        user
        post '/api/auth/signin', params: wrong_email, headers: headers
        expect(response).to have_http_status(422)
      end

      it 'using wrong password should return failed' do
        user
        post '/api/auth/signin', params: wrong_password, headers: headers
        expect(response).to have_http_status(422)
      end

      it 'user successfully login' do
        post '/api/auth/signin', params: valid_params, headers: headers
        expect(response).to have_http_status(201)
      end
    end
  end

  context 'Profile' do
    describe 'Authorized' do
      it 'return success' do
        get '/api/profile', headers: headers
        expect(response).to have_http_status(200)
      end
    end

    describe 'Unauthorized' do
      it 'return failed' do
        get '/api/profile'
        expect(response).to have_http_status(401)
      end
    end
  end

  context 'Forgot Password' do
    let(:valid_params) { { email: 'saiful@gmail.com' } }
    let(:invalid_params) { { email: 'saiful12@gmail.com' } }
    it 'using existing email should return success' do
      user
      post '/api/users/forgot_password', params: valid_params
      expect(response).to have_http_status(200)
    end

    it 'using non-existing email should return failed' do
      post '/api/users/forgot_password', params: invalid_params
      expect(response).to have_http_status(422)
    end
  end

  context 'Reset Password' do
    let(:valid_params) { { email: 'saiful@gmail.com', token: 'fdhsfosdkfhdsafoihf', password: '111111' } }
    let(:invalid_params) { { email: 'saiful12@gmail.com', token: 'fdhsfosdkfhdsafoihf', password: '111111' } }

    it 'using valid email and token should return success' do
      user.update_column(:reset_password_token, 'fdhsfosdkfhdsafoihf')
      post '/api/users/set_new_password', params: valid_params
      expect(response).to have_http_status(200)
    end

    it 'using invalid email should return failed' do
      post '/api/users/set_new_password', params: invalid_params
      expect(response).to have_http_status(422)
    end
  end
end
