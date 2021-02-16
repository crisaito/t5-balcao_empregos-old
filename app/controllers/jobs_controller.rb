class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    @company = Company.find(params[:id])
  end
end