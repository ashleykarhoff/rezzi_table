class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
<<<<<<< HEAD
  has_one :review, :dependent => :delete

  validates_presence_of :reservation_time, :reservation_date, :party_size
  validate :present_or_future_reservation_date

  def present_or_future_reservation_date
    errors.add(:reservation_date, "Reservation date can't be in the past") if
      reservation_date.to_datetime < DateTime.now
  end
=======
  has_one :review

  def restaurant_name
    self.restaurant.name 
  end 

>>>>>>> master

end
