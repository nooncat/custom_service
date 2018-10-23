class Cabinet::CompaniesController < Cabinet::ApplicationController
  before_action :set_resource, only: [:edit, :update, :destroy]

  def index
    @q = Company.ransack params[:q]
    @collection = @q.result.page(params[:page])
  end

  def new
    @resource = Company.new
  end

  def edit
  end

  def create
    @resource = Company.new(company_params)

    if @resource.save
      redirect 'Контрагент создан.'
    else
      render :new
    end
  end

  def update
    if @resource.update(company_params)
      redirect 'Контрагент обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to [:cabinet, :companies], notice: 'Контрагент удален.'
  end

  private

  def redirect(msg)
    if params[:commit] == 'Сохранить'
      redirect_to [:edit, :cabinet, @resource], notice: msg
    else
      redirect_to [:cabinet, :companies], notice: msg
    end
  end

  def set_resource
    @resource = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:ogrn, :inn, :kpp, :uridicheskiy_address, :real_address,
      :bank_schet, :bank_name, :bank_bik, :bank_city, :bank_kor_schet, :phone, :email,
      :users_id, :agreement_num, :name, :director
    )
  end
end
