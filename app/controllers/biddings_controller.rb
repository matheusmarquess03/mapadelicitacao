class BiddingsController < ApplicationController
  before_action :set_bidding, only: [:show, :edit, :update, :destroy]
  before_action :redirect_cancel, only: [:reports]
  
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
  end

  # GET /biddings/new
  def new
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
        format.html { redirect_to biddings_path, notice: 'Bidding was successfully created.' }
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
        format.html { redirect_to biddings_path, notice: 'Bidding was successfully updated.' }
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
      format.html { redirect_to biddings_path, notice: 'Bidding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def reports
	@q = Bidding.ransack(params[:q])

	@biddings = @q.result
					.order(date: :asc)

	respond_to do |format|
		format.html
    end
  end

  def prospection
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
      @bidding = Bidding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bidding_params
      pp = params.require(:bidding).permit(:date, :organ, :modality, :object, :value, :inspection, :budge, :remark, :status)
	  pp[:status] = params[:bidding][:status].to_i
	  
	  return pp
    end
	
	def redirect_cancel
		redirect_to biddings_path if params[:cancel]
	end
	
end
