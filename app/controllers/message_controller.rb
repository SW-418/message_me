# frozen_string_literal: true

class MessageController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(body: params[:message])
    return unless message.save

    redirect_to root_path
  end
end
