# frozen_string_literal: true

module AppHelper
  def current_user
    User.first_or_create(
      name: 'testUser',
      email: 'saiful@gmail.com',
      password: '111111'
    )
  end

  def user
    User.first_or_create(
      name: 'testUser',
      email: 'saiful@gmail.com',
      password: '111111'
    )
  end

  def auth_token
    Knock::AuthToken.new(payload: { sub: current_user.id }).token
  end

  def headers
    { Authorization: "Bearer #{auth_token}" }
  end

  def user_valid_params
    {
      user:
        {
          name: 'testUser',
          email: 'saiful@gmail.com',
          password: '111111'
        }
    }
  end

  def user_invalid_params
    { user: { email: 'saiful@gmail.com' } }
  end

  ## products

  def product
    Product.first_or_create(
      user_id: current_user.id,
      name: 'testUser',
      price: 120_000,
      category: 'minuman'
    )
  end

  def product_valid_params
    {
      product:
        {
          user_id: current_user.id,
          name: 'testUser',
          price: 120_000,
          category: 'minuman'
        }
    }
  end

  def product_invalid_params
    { product: { name: 'saiful@gmail.com' } }
  end

  ## mail test

  def valid_user_mail
    user
  end

  def invalid_user_mail
    OpenStruct.new({ name: 'testUSer', email: nil })
  end
end
