class BusinessIndividualsController < ApplicationController
  before_action :set_business_individual, only: [:show, :edit, :update, :destroy]

  # GET /business_individuals
  # GET /business_individuals.json
  def index
    @business_individuals = BusinessIndividual.all
  end

  # GET /business_individuals/1
  # GET /business_individuals/1.json
  def show
  end

  # GET /business_individuals/new
  def new
    @business_individual = BusinessIndividual.new
  end

  # GET /business_individuals/1/edit
  def edit
  end

  # POST /business_individuals
  # POST /business_individuals.json
  def create
    @business_individual = BusinessIndividual.new(business_individual_params)

    respond_to do |format|
      if @business_individual.save
        format.html { redirect_to @business_individual, notice: 'Business individual was successfully created.' }
        format.json { render :show, status: :created, location: @business_individual }
      else
        format.html { render :new }
        format.json { render json: @business_individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_individuals/1
  # PATCH/PUT /business_individuals/1.json
  def update
    respond_to do |format|
      if @business_individual.update(business_individual_params)
        format.html { redirect_to @business_individual, notice: 'Business individual was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_individual }
      else
        format.html { render :edit }
        format.json { render json: @business_individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_individuals/1
  # DELETE /business_individuals/1.json
  def destroy
    @business_individual.destroy
    respond_to do |format|
      format.html { redirect_to business_individuals_url, notice: 'Business individual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_individual
      @business_individual = BusinessIndividual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_individual_params
      params.require(:business_individual).permit(:name, :mobile, :city, :Pan, :Bank_name, :Account_no, :IFSC, :referal)
    end
end
