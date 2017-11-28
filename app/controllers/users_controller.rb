class UsersController < ApplicationController
	def new
    	@user = User.new
  	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			Pony.mail(:to => 'belousovatanya1995@yandex.ru', :from => 'Заявка с сайта', :html_body => '<h1>Hello there!</h1>', :subject => 'hi', :body => "In case you can't read html, Hello there.")
    	else
     		render 'new'
    	end
	end

	private

	    def user_params
	      params.require(:user).permit(:name, :phone, :email, :text)
	    end
end