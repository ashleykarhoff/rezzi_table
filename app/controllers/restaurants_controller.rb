require 'time'

class RestaurantsController < ApplicationController
<<<<<<< HEAD
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        @reservation_times = @restaurant.reservations.map {|reservation| reservation.reservation_time}

        @times = ["12:00pm", "12:30pm", "1:00pm", "1:30pm", "2:00pm", "2:30pm", "3:00pm", "3:30pm", "4:00pm", "4:30pm", "5:00pm", "5:30pm", "6:00pm", "6:30pm", "7:00pm", "7:30pm", "8:00pm", "8:30pm", "9:00pm", "9:30pm", "10:00pm", "10:30pm", "11:00pm"]

    end
=======
    before_action :require_login






    private 
    def require_login
        return head(:forbidden) unless session.include? :user_id
      end
    
>>>>>>> master
end
