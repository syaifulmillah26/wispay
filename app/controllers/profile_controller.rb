# frozen_string_literal: true

# profile controller
class ProfileController < ResourceController
  def index
    render json: result(current_user), status: 200
  rescue StandardError => e
    render json: { error: e.message }, status: 500
  end
end
