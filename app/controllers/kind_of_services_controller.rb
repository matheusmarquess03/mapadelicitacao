class KindOfServicesController < ApplicationController
  before_action :set_kind_of_service, only: [:show, :edit, :update, :destroy]

  # GET /kind_of_services
  # GET /kind_of_services.json
  def index
    @kind_of_services = KindOfService.all
  end

  # GET /kind_of_services/1
  # GET /kind_of_services/1.json
  def show
  end

  # GET /kind_of_services/new
  def new
    @kind_of_service = KindOfService.new
  end

  # GET /kind_of_services/1/edit
  def edit
  end

  # POST /kind_of_services
  # POST /kind_of_services.json
  def create
    @kind_of_service = KindOfService.new(kind_of_service_params)

    respond_to do |format|
      if @kind_of_service.save
        format.html { redirect_to @kind_of_service, notice: 'Kind of service was successfully created.' }
        format.json { render :show, status: :created, location: @kind_of_service }
      else
        format.html { render :new }
        format.json { render json: @kind_of_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kind_of_services/1
  # PATCH/PUT /kind_of_services/1.json
  def update
    respond_to do |format|
      if @kind_of_service.update(kind_of_service_params)
        format.html { redirect_to @kind_of_service, notice: 'Kind of service was successfully updated.' }
        format.json { render :show, status: :ok, location: @kind_of_service }
      else
        format.html { render :edit }
        format.json { render json: @kind_of_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kind_of_services/1
  # DELETE /kind_of_services/1.json
  def destroy
    @kind_of_service.destroy
    respond_to do |format|
      format.html { redirect_to kind_of_services_url, notice: 'Kind of service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind_of_service
      @kind_of_service = KindOfService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kind_of_service_params
      params.require(:kind_of_service).permit(:name)
    end
end
