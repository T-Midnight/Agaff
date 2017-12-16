# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, except: :destroy

  def new
    @session_form = SessionForm.new User.new
    @from = params[:url]
  end

  def create
    @session_form = SessionForm.new User.find_or_initialize_by login: params[:session][:login]
    if @session_form.validate params[:session]
      sign_in @session_form.model.login
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
