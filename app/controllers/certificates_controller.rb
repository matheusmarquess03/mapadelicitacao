class CertificatesController < ApplicationController
  before_action :set_certificate_list, only: %i[reports]
  before_action :set_certificate, only: [:show, :edit, :update, :destroy]
  before_action :redirect_cancel, only: [:reports]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user! 
  protect_from_forgery with: :null_session
  # GET /certificates
  # GET /certificates.json
  def index
    @certificates = Certificate.limit(100)
    respond_to do |format|
    format.html
    format.csv {send_data @certificates.to_csv (['number', 'value', 'object', 'responsible_enginner', 'work_site', 'year', 'deadline', 'start_date', 'end_date',
      'book', 'item', 'description','unit','quantity','kind_of_service','path_file', 'company_name', 'verified'])}
  end
  end

  # GET /certificates/1
  # GET /certificates/1.json
  def show
  end

  # GET /certificates/new
  def new
	@list_kind_of_services = KindOfService.order(name: :asc)
    @certificate = Certificate.new
  end

  # GET /certificates/1/edit
  def edit
  end

  # POST /certificates
  # POST /certificates.json
  def create
    
    @certificate = Certificate.new(certificate_params)

    respond_to do |format|
      if @certificate.save
        format.html { redirect_to certificates_path, notice: 'Certificação cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @certificate }
      else
        format.html { render :new }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificates/1
  # PATCH/PUT /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(certificate_params)
        format.html { redirect_to certificates_path, notice: 'Certificação atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @certificate }
      else
        format.html { render :edit }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificates/1
  # DELETE /certificates/1.json
  def destroy
    @certificate.destroy
    respond_to do |format|
      format.html { redirect_to certificates_url, notice: 'Certificate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def reports
	@list_kind_of_services = KindOfService.all.order(name: :asc)
	
    @q = Certificate.ransack(params[:q])

    @certificates = @q.result
            .order(description: :asc)
			.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.csv {send_data("\uFEFF" + Certificate.certificate_csv(@certificates),
                    filename: "tabela-de-atestados-#{Date.today}.csv")}  
      end
    end

  private
	def set_certificate
		@list_kind_of_services = KindOfService.order(name: :asc)
		@certificate = Certificate.find(params[:id])
	end
    
	# Use callbacks to share common setup or constraints between actions.
    def set_certificate_list
    @responsible_enginner_list = Certificate.select(:responsible_enginner).distinct
		@company_list = Certificate.select(:company_name).distinct
		@certificate_list = Certificate.all.order(description: :asc)
    end

    # Only allow a list of trusted parameters through.
    def certificate_params
      pp = params.require(:certificate).permit(:number, :value, :object, :responsible_enginner, :work_site, :year, :deadline, :start_date, :end_date, :book, :item, :description, :unit, :quantity, :kind_of_service_id, :path_file, :company_name, :verified)
      pp[:verified] = params[:certificate][:verified].to_i

       return pp
    end

    def redirect_cancel
    redirect_to certificates_path if params[:cancel]
  end
end
