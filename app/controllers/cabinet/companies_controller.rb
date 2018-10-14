class Cabinet::CompaniesController < Cabinet::ApplicationController
  before_action :set_company, only: [:edit, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.all.order(:id)
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to [:cabinet, :companies], notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to [:edit, :cabinet, @company], notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to [:cabinet, :companies], notice: 'Company was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company).permit(:ogrn, :inn, :kpp, :uridicheskiy_address, :real_address, :bank_schet, :bank_name, :bank_bik, :bank_city, :bank_kor_schet, :phone, :email, :users_id)
    end
end