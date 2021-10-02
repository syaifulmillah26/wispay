# frozen_string_literal: true

# usertoken controller
class UserTokenController < ::Knock::AuthTokenController
  skip_before_action :verify_authenticity_token, raise: false
end
