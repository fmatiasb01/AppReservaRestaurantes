class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @tables = Table.where(available: true)
  end

  def create
    @reservation = Reservation.new(reservation_params)

    candidate_tables = Table
                        .where(available: true)
                        .where("capacity >= ?", @reservation.people_count)
                        .includes(:reservations)

    @table = candidate_tables.find do |table|
      table.reservations.none? do |r|
        r.reservation_time.to_i == @reservation.reservation_time.to_i
      end
    end

    if @table
      @reservation.table = @table

      if @reservation.save
        @table.update(available: false)
        redirect_to @reservation, notice: "Reserva confirmada exitosamente."
      else
        flash.now[:alert] = "Hubo un problema al crear la reserva."
        @tables = Table.where(available: true)
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "No hay mesas disponibles para esa cantidad de personas en ese horario."
      @tables = Table.where(available: true)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.table.update(available: true)
    @reservation.destroy
    redirect_to new_reservation_path, notice: "La reserva ha sido cancelada correctamente."
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :people_count, :reservation_time)
  end
end
