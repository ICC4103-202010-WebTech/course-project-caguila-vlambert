class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/:id
  # GET /organizations/1.json
  def show
    @my_org_participants = OrganizationUser.where(organization_id:@organization.id).pluck(:user_id)
    @my_org_participants_time_whenjoin = OrganizationUser.where(organization_id:@organization.id).pluck(:created_at) 
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    10.times {@organization.organization_users.build}
  end

  # GET /organizations/1/edit
  def edit
    @organization.organization_users.uniq
    10.times {@organization.organization_users.build}
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    @organization.organization_users.uniq
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.delete
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:name, :description, :place, :organization_users_attributes => [:user_id,:organization_id])
      #params.fetch(:organization_users,{}).permit(:user_id,:organization_id)
    end
end
