class UsersController < ApplicationController
    


    def index
        
    end
    

    # homepage page
    def show
<<<<<<< HEAD
    @user = User.find(session[:user])
=======
    return head(:forbidden) unless session.include? :user_id

    @user = User.find(session[:user_id])
>>>>>>> master
    @reservations = @user.reservations
    end

    # signup page - needs to be able to be shown if not logged in 
    def new
        @user = User.new
    end

    def create
       
        @user = User.new(user_params)

        if @user.save
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to signup_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end
<<<<<<< HEAD
end
=======

end
>>>>>>> master
