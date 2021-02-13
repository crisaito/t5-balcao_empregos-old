class CompaniesController < ApplicationController
  def index 
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
  end

  def create
    @company = Company.new(params.require(:company).permit(
      :name,
      :description,
      :address,
      :cnpj,
      :site,
      :linkedin,
      :logo))
    @company.save
    redirect_to company_path(id: @company.id)
  end
end