class Cabinet::CompaniesController < Cabinet::ApplicationController
  before_action :set_company, only: [:edit, :update, :destroy]

  def index
    @companies = Company.all.order(:id)
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to [:cabinet, :companies], notice: 'Контрагент создан.'
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to [:edit, :cabinet, @company], notice: 'Контрагент обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to [:cabinet, :companies], notice: 'Контрагент удален.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:ogrn, :inn, :kpp, :uridicheskiy_address, :real_address,
      :bank_schet, :bank_name, :bank_bik, :bank_city, :bank_kor_schet, :phone, :email,
      :users_id, :agreement_num
    )
  end
end
