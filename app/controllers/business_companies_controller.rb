class BusinessCompaniesController < ApplicationController
  before_action :set_business_company, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /business_companies
  # GET /business_companies.json
  def index
    @business_companies = BusinessCompany.all
  end

  # GET /business_companies/1
  # GET /business_companies/1.json
  def show
  end

  # GET /business_companies/new
  def new
    @business_company = BusinessCompany.new
  end

  # GET /business_companies/1/edit
  def edit
  end

  # POST /business_companies
  # POST /business_companies.json
  def create
    @business_company = BusinessCompany.new(business_company_params)

    respond_to do |format|
      if @business_company.save
        format.html { redirect_to @business_company, notice: 'Business company was successfully created.' }
        format.json { render :show, status: :created, location: @business_company }
      else
        format.html { render :new }
        format.json { render json: @business_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_companies/1
  # PATCH/PUT /business_companies/1.json
  def update
    respond_to do |format|
      if @business_company.update(business_company_params)
        format.html { redirect_to @business_company, notice: 'Business company was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_company }
      else
        format.html { render :edit }
        format.json { render json: @business_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_companies/1
  # DELETE /business_companies/1.json
  def destroy
    @business_company.destroy
    respond_to do |format|
      format.html { redirect_to business_companies_url, notice: 'Business company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_company
      @business_company = BusinessCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_company_params
      params.require(:business_company).permit(:company_name, :website_url, :company_email, :contact_person, :mobile, :city, :services, :Pan, :Bank_name, :Account_no, :IFSC, :TIN, :TAN, :referal)
    end
end
