# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successully logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'Incorrect login information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out'
    redirect_to login_path
  end

  private

  def logged_in_redirect
    return unless logged_in?

    flash[:error] = 'You are already logged in'
    redirect_to root_path
  end
end
