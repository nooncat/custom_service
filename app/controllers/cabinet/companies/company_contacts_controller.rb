class Cabinet::Companies::CompanyContactsController < Cabinet::ApplicationController
  before_action :set_company
  before_action :set_company_contacts, only: [:edit, :update, :destroy]

  def new
    @resource = @company.company_contacts.build
  end

  def create
    @resource = @company.company_contacts.build(premitted_params)

    if @resource.save
      redirect_to [:edit, :cabinet, @company], notice: 'Контакт создан.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resource.update(premitted_params)
      redirect_to [:edit, :cabinet, @company], notice: 'Контакт обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to [:edit, :cabinet, @company], notice: 'Контакт удален.'
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_company_contacts
    @resource = @company.company_contacts.find(params[:id])
  end

  def premitted_params
    params.require(:company_contact).permit(:name, :middlename, :lastname, :phone, :email)
  end
end
