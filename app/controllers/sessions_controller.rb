class SessionsController < ApplicationController
    def index
    end

    def create
        user = User.find(params[:email])
        if user
            if user.authenticate(params[:password])
                flash[:success] = ["User successfully logged in!"]
                redirect_to "/"
            else
                flash[:error] = ["Sorry, that password is invalid"]
                redirect_to "/"
            end
        else
            flash[:error] = ["That email does not exist! Create an account?"]
            redirect_to "/"
        end
    end
end
