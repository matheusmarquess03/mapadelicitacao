class ProvidersController < ApplicationController
   before_action :load_filter_params, only: %i[reports]
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
    respond_to do |format|
    format.html
    format.csv {send_data @certificates.to_csv (['unity', 'value', 'company', 'adress', 'state', 'phone', 'email', 'website', 'contact',
      'remark', 'description', 'status', 'quotation_date'])}
  end
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reports
  load_filter_params
  
  @q = Provider.ransack(params[:q])

   @provider = @q.result
          .order(company: :asc)       

  respond_to do |format|
    format.html
    format.csv {send_data("\uFEFF" + Provider.provider_csv(@provider),
                    filename: "planilha-de-fornecedores-#{Date.today}.csv")}   

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def provider_params
      pp = params.require(:provider).permit(:unity, :value, :company, :adress, :state, :phone, :email, :website, :contact, :remark, :description, :status, :quotation_date)
      pp[:state] = params[:provider][:state].to_i
    
    return pp
    end

    def load_filter_params
    if (params[:q].present?)
      
      @quotation_date_gteq = params[:q][:quotation_date_gteq]
      @quotation_date_lteq = params[:q][:quotation_date_lteq]
      @description_cont = params[:q][:description_cont]
      @state_eq = params[:q][:state_eq]
      @company_eq = params[:q][:company_eq]
    end
  end
end
