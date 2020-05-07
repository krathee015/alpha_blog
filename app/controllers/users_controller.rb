class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @a_index = @user.articles
    end

    def new
        @user = User.new
    end

    def index
        @users = User.all 
    end 

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_pramas)
            flash[:notice]= "User Account is updated successfully"
            redirect_to articles_path
            
        else
            render 'edit'
        end
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
