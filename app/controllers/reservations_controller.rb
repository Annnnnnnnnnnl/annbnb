class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def create
    @reservation = current_user.reserations.create (reservation_params)

    redirect_to @reservation.rooms, notice: "Your reservation is successful..."
  end

  private
    def  reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)
    end

end
