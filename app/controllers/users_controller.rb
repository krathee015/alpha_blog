class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
       
        @user = User.new(user_pramas)
       # @article.user = User.first
       
        if @user.save
       
            flash[:notice] = "Welcome to Alpha blog, #{@user.username} have successfully signed up"    
            redirect_to articles_path #shortcut 
        else 
            render 'new'
        end
    end 

    private
    def user_pramas
        params.require(:user).permit(:username, :email, :password)
    end

end
