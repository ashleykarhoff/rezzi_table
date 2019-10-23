class ReservationsController < ApplicationController
    before_action :require_login
 
    def new
        @user = user
        @reservation = Reservation.new
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def create
        @user = user
        @reservation = Reservation.new(reservation_params)

        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            flash[:errors] = @reservation.errors.full_messages
            redirect_to new_reservation_path
        end
    end

    def show
        @user = user
        @reservation = find_reservation
    end

    def edit 
        @user = user
        @reservation = find_reservation
        @restaurant = @reservation.restaurant
    end 

    def update 
        @reservation = find_reservation
        @reservation.update(reservation_params)
        
        if @reservation.save 
            redirect_to reservation_path(@reservation)
        else
            flash[:errors] = @reservation.errors.full_messages
            redirect_to edit_reservation_path(@reservation)
        end 
    end 

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy!
        redirect_to user_path(user), :notice => "Your reservation has been deleted"
    end
    

    def edit 
        @reservation = Reservation.find(params[:id])
        @restaurant = @reservation.restaurant

    end 

    def update 

        @user = User.find(session[:user])
        @reservation = Reservation.find(params[:id])
        @reservation.update(reservation_params)
            if @reservation.save 
                redirect_to user_path(@user)
            end 


    end 


    private

    def find_reservation
        Reservation.find(params[:id])
    end

    def user
        User.find(session[:user])
    end

    def reservation_params
        params.require(:reservation).permit(:reservation_time, :reservation_date, :party_size, :restaurant_id, :user_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
