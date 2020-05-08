class SessionsController < ApplicationController

def new
end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id #this help the user to sign in for the remaining session 
        flash[:notice] ="Logged in successfully"
        redirect_to user
        
    else
        flash.now[:alert] = "Credentials are not correct"
        render 'new' 

    end
end

def destroy
    session[:user_id] = nil
    flash[:notice] ="Logged out"
    redirect_to root_path
end

end
