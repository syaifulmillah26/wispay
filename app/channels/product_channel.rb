# frozen_string_literal: true

# ProductChannel
class ProductChannel < ApplicationCable::Channel
  # calls when a client connects to the server
  def subscribed
    stream_from('ProductChannel')
  end
end
