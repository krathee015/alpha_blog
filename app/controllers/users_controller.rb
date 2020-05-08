class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy ]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]


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

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user 
        flash[:notice] = " Account and all associated articles are successfully deleted"
        redirect_to root_path 
    end 

   

    private
    def user_pramas
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] ="you can only edit or delete your own profile"
            redirect_to @user
        end
    end

end
