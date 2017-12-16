# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, except: :destroy

  def new
    @session_form = User.new
  end

  def create
    @session_form = User.find email: params[:session][:email]
    if @session_form.authenticate params[:session][:password]
      sign_in @session_form
      redirect_to actual_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to actual_path
  end

  private

  def redirect_if_signed_in
    redirect_to root_path if signed_in?
  end

  def actual_path
    params[:url] || root_path
  end
end
