class Admin::OrganisationsController < Admin::ApplicationController
  before_action :set_organisation, only: [:edit, :update, :destroy]

  def index
    @organisations = Organisation.order("id desc").all
  end

  def new
    @organisation = Organisation.new
  end

  def edit
  end

  def create
    @organisation = Organisation.new(organisation_params)
    respond_to do |format|
      if @organisation.save
        format.html { redirect_to admin_organisations_path, notice: 'New organisation has been saved.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @organisation = Organisation.find(params[:id])
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to admin_organisations_path, notice: 'Event has been updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to admin_organisations_path }
      format.json { head :no_content }
    end
  end

  private
  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(:name, :description, :link)
  end
end