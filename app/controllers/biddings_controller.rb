class BiddingsController < ApplicationController
  before_action :set_bidding, only: [:show, :edit, :update, :destroy, :check]
  before_action :redirect_cancel, only: [:reports]
  before_action :redirect_prop_cancel, only: [:prospection]
  
  skip_before_action :verify_authenticity_token 
  protect_from_forgery with: :null_session
  
  # GET /biddings
  # GET /biddings.json
  def index
	@bidding = Bidding.order(date: :asc)
	respond_to do |format|
		format.html
		format.csv {send_data @biddings.to_csv (['date', 'organ', 'modality', 'object', 'value', 'inspection', 'budge', 'remark', 'status'])}
  end
end


  def import
  	Bidding.import(params[:file])
  	redirect_to root_url, notice: "Arquivo Importado"
 end
  	

  # GET /biddings/1
  # GET /biddings/1.json
  def show
	load_filter_params
	
	@list_companies = Company.order(name: :asc)
	@list_kind_of_services = KindOfService.order(name: :asc)
  end

  # GET /biddings/new
  def new
    load_filter_params
	
	@list_companies = Company.order(name: :asc)
	@list_kind_of_services = KindOfService.order(name: :asc)
	@startPage = params[:startPage]
    @bidding = Bidding.new
  end

  # GET /biddings/1/edit
  def edit
	load_filter_params
	
  end

  # POST /biddings
  # POST /biddings.json
  def create
	params[:bidding][:status] = 1
	params[:bidding][:company_id] = 1
	
    @bidding = Bidding.new(bidding_params)
	
	@list_kind_of_services = KindOfService.order(name: :asc)

    respond_to do |format|
      if @bidding.save
		load_filter_params
		
        format.html { redirect_to prospection_path(q: {:created_at_eq => @created_at_eq, :organ_cont => @organ_cont, :date_gteq => @date_gteq, :date_lteq => @date_lteq, :kind_of_service_id_eq => @kind_of_service_id_eq, :status_eq => @status_eq}), notice: 'Bidding was successfully created.' }
        format.json { render :new, status: :created, location: @bidding }
      else
        format.html { render :new }
        format.json { render json: @bidding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biddings/1
  # PATCH/PUT /biddings/1.json
  def update
    respond_to do |format|
      if @bidding.update(bidding_params)
        format.html { 
			load_filter_params
			if(params[:startPage] == "prop")
				redirect_to prospection_path(q: {:created_at_eq => @created_at_eq, :organ_cont => @organ_cont, :date_gteq => @date_gteq, :date_lteq => @date_lteq, :kind_of_service_id_eq => @kind_of_service_id_eq, :status_eq => @status_eq}), notice: 'Bidding was successfully updated.' 
			else 
				redirect_to biddings_path(q: {:organ_cont => @organ_cont, :date_gteq => @date_gteq, :date_lteq => @date_lteq, :kind_of_service_id_eq => @kind_of_service_id_eq, :company_id_eq => @company_id_eq, :status_eq => @status_eq}), notice: 'Bidding was successfully updated.' 
			end
		}
        format.json { render :show, status: :ok, location: @bidding }
      else
        format.html { render :edit }
        format.json { render json: @bidding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biddings/1
  # DELETE /biddings/1.json
  def destroy
    @bidding.destroy
    respond_to do |format|
		format.html { 
			if(params[:startPage] == "prop")
				redirect_to prospection_path, notice: 'Bidding was successfully destroyed.' 
			else 
				redirect_to biddings_path, notice: 'Bidding was successfully destroyed.' 
			end
		}
		format.json { head :no_content }
    end
  end
  
  def check
    respond_to do |format|
      if @bidding.update(status: 7)
        format.html { 
			if(params[:startPage] == "prop")
				load_filter_params
				redirect_to prospection_path(q: {:created_at_eq => @created_at_eq, :organ_cont => @organ_cont, :date_gteq => @date_gteq, :date_lteq => @date_lteq, :kind_of_service_id_eq => @kind_of_service_id_eq, :status_eq => @status_eq}), notice: 'Bidding was successfully updated.' 
			else 
				redirect_to biddings_path, notice: 'Bidding was successfully updated.' 
			end
		}
        format.json { render :show, status: :ok, location: @bidding }
      else
        format.html { render :edit }
        format.json { render json: @bidding.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def reports
	load_filter_params
	
	@list_companies = Company.order(name: :asc)
	@list_kind_of_services = KindOfService.all.order(name: :asc)
	
    resultB = Bidding.joins(:company).where("status != ?", 1)
	
	@q = resultB.ransack(params[:q])

	@biddings = @q.result
					.order(date: :asc)

	respond_to do |format|
		format.html
		

		format.csv {send_data(Bidding.bidding_csv(@biddings),
                    filename: "mapa-de-licitacao-#{Date.today}.csv")}		
    end
  end

  def prospection
	load_filter_params
  
    @list_kind_of_services = KindOfService.all.order(name: :asc)

	@q = Bidding.joins(:company).ransack(params[:q])

	@biddings = @q.result
          .order(date: :asc)

	respond_to do |format|
		format.html        
        format.csv {send_data(Bidding.bidding_csv(@biddings),
                    filename: "tabela-de-prospeccao-#{Date.today}.csv")}		
    end
  end

  def destroy_attachment
      @blob_file = ActiveStorage::Blob.find_signed(params[:id])
      @blob_file.attachments.first.purge
      @blob_file.purge
      redirect_back fallback_location: biddings_path
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bidding
		@list_companies = Company.order(name: :asc)
		@list_kind_of_services = KindOfService.all.order(name: :asc)
		@startPage = params[:startPage]
		@bidding = Bidding.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    

    # Only allow a list of trusted parameters through.
    def bidding_params
      pp = params.require(:bidding).permit(:date, :organ, :modality, :object, :value, :value_abbr, :inspection, :budge, :remark, :status, :website, :type_of_certificate, :company_id, :kind_of_service_id, :uploads)
	  pp[:status] = params[:bidding][:status].to_i
	  pp[:type_of_certificate] = params[:bidding][:type_of_certificate].to_i
	  pp[:company_id] = params[:bidding][:company_id].to_i
      pp[:kind_of_service_id] = params[:bidding][:kind_of_service_id].to_i
	  
	  return pp
    end
	
	def redirect_cancel
		redirect_to biddings_path if params[:cancel]
	end
	
	def redirect_prop_cancel
		redirect_to prospection_path if params[:cancel]
	end
	
	def load_filter_params
		if (params[:q].present?)
			if(params[:startPage] == "prop")
				@created_at_eq = params[:q][:created_at_eq]
			else 
				@company_id_eq = params[:q][:company_id_eq]
			end
			
			@organ_cont = params[:q][:organ_cont]
			@date_gteq = params[:q][:date_gteq]
			@date_lteq = params[:q][:date_lteq]
			@kind_of_service_id_eq = params[:q][:kind_of_service_id_eq]
			@status_eq = params[:q][:status_eq]
		end
	end
	
	
end

	
	

