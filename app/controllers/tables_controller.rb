class TablesController < ApplicationController
  http_basic_authenticate_with name: "empleado", password: "1234", only: [:index, :release]

  def index
    @tables = Table.all.order(:name)
  end

  def release
    @table = Table.find(params[:id])
    @table.update(available: true)
    redirect_to tables_path, notice: "La mesa #{@table.name} ha sido liberada."
  end
end
