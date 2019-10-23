class ReservationsController < ApplicationController
    before_action :require_login
    
    
    
    def show
        @user = User.find(session[:user])
        @reservation = Reservation.find(params[:id])

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

    def reservation_params
        params.require(:reservation).permit(:reservation_time, :reservation_date, :party_size)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
      end


end
