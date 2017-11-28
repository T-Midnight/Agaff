class PagesController < ApplicationController
  def home
  	@user = User.new
  end

  def projects
  end
end
