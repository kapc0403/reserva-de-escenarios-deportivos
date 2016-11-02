class ReservasController < ApplicationController
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  # GET /reservas
  # GET /reservas.json
  def index
    if current_user.rol == "Administrador"
      @reservas = Reserva.all
    else
      @reservas = Reserva.where("user_id = ?", current_user.id)
    end
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    @asd = (params[:idDeEscenario])
    #validación de que este confirmada para que no deje reservar si aun esta en proceso
    @resVerif = Reserva.where("escenario_id = ? and estado = ?", @asd, 1)
      if !@resVerif.empty?
        redirect_to escenarios_path
        flash[:notice] = 'La reserva de este escenario se encuentra en estado de proceso.'
      end
    #abort @resVerif.inspect
    @reserva = Reserva.new()
  end

  # GET /reservas/1/edit
  def edit
  end
  
  def changestatereserva
    @asd = Reserva.update(params[:id], :estado => "2" )
    redirect_to reservas_path
  end

  # POST /reservas
  # POST /reservas.json
  def create
    #abort @resVerifByHour.inspect
    @reserva = Reserva.new(reserva_params)
    @resVerifByHour = Reserva.where("escenario_id = ? and fecha = ?", @reserva.escenario, @reserva.fecha)
    #abort @reserva.horainicio(1i).inspect
    if !@resVerifByHour.empty?
      @reserva.destroy
      redirect_to escenarios_path
      flash[:notice] = 'Este escenario ya se encuentra reservado por otro usuario.'
    else
      respond_to do |format|
        @reserva.estado = "1"
        @reserva.save
        if @reserva.save
          format.html { redirect_to escenarios_path, notice: 'Reserva was successfully created.' }
          format.json { render :show, status: :created, location: @reserva }
        else
          format.html { render :new }
          format.json { render json: @reserva.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: 'Reserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: 'Reserva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_params
      params.require(:reserva).permit(:escenario_id, :user_id, :fecha, :horainicio, :horafin, :estado)
    end
end
