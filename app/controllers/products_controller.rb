# frozen_string_literal: true

# Products controller
class ProductsController < ResourceController
  before_action :set_user, only: :create
  before_action :set_object, only: %i[show update destroy upload_image]

  def index
    @objects = model_class
    render json: results(@objects.with_attached_image), status: 200
  rescue StandardError => e
    render json: { message: e.message }, status: 500
  end

  private

  def set_user
    params[:product][:user_id] = current_user.id
  end
end
