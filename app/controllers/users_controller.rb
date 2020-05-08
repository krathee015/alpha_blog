class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update ]
   
    def show
        
        @a_index = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end 

    def edit
       
    end

    def update
        
        if @user.update(user_pramas)
            flash[:notice]= "User Account is updated successfully"
            redirect_to @user
            
        else
            render 'edit'
        end
    end
     

    def create
       
        @user = User.new(user_pramas)
       # @article.user = User.first
       
        if @user.save
            session[:user_id] = @user.id
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

    def set_user
        @user = User.find(params[:id])
    end

end
