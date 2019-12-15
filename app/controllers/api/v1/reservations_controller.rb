class Api::V1::ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all
        render json: @reservations.to_json
    end

    def create
        if Reservation.where(:user => params[:user],:date => params[:date] ).present?
            render json: {
                message: "Ya se ha realizado una reserva para este usuario en este horario",
                status: 400,
            }
        else 
            @reservation = Reservation.new({:people => params[:people], :phone => params[:phone],
             :date => params[:date] ,:observation => params[:observation] , :user_id => params[:user_id]})
            @reservation.save
            render json: {
                message: "Reserva realizada con éxito",
                status: 200
            }
        end
    end
end
