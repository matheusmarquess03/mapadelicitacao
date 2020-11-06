class BiddingsController < ApplicationController
  before_action :set_bidding, only: [:show, :edit, :update, :destroy, :check]
  before_action :redirect_cancel, only: [:reports]
  before_action :redirect_prop_cancel, only: [:prospection]
  
  skip_before_action :verify_authenticity_token 
  protect_from_forgery with: :null_session
  
  # GET /biddings
  # GET /biddings.json
  def index
	@biddings = Bidding.order(date: :asc)
  end

  # GET /biddings/1
  # GET /biddings/1.json
  def show
	@list_companies = Company.order(name: :asc)
  @list_kind_of_services = KindOfService.order(name: :asc)
  end

  # GET /biddings/new
  def new
	@list_companies = Company.order(name: :asc)
  @list_kind_of_services = KindOfService.order(name: :asc)
	@startPage = params[:startPage]
    @bidding = Bidding.new
  end

  # GET /biddings/1/edit
  def edit
  end

  # POST /biddings
  # POST /biddings.json
  def create
    @bidding = Bidding.new(bidding_params)

    respond_to do |format|
      if @bidding.save
        format.html { redirect_to prospection_path, notice: 'Bidding was successfully created.' }
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
			if(params[:startPage] == "prop")
				redirect_to prospection_path, notice: 'Bidding was successfully updated.' 
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
      if @bidding.update(status: 2)
        format.html { 
			if(params[:startPage] == "prop")
				redirect_to prospection_path, notice: 'Bidding was successfully updated.' 
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
    @list_kind_of_services = 10 #KindOfService.all.order(name: :asc)
    @q = Certificate.ransack(params[:q])

    resultB = Bidding.where("status != ?", 1)
	
	@q = resultB.ransack(params[:q])

	@biddings = @q.result
					.order(date: :asc)

	respond_to do |format|
		format.html
    end
  end

  def prospection
    @list_kind_of_services = KindOfService.all.order(name: :asc)

	@q = Bidding.ransack(params[:q])

	@biddings = @q.result
          .order(date: :asc)

	respond_to do |format|
		format.html
    end
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
      pp = params.require(:bidding).permit(:date, :organ, :modality, :object, :value, :inspection, :budge, :remark, :status, :website, :type_of_certificate, :company_id, :kind_of_service_id)
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
	
	
end
