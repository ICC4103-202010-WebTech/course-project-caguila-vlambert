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
  def search
    @organizations = Organization.where("name like ?", "%#{params[:q]}%")
  end
  # GET /organizations/new
  def new
    @organization = Organization.new
    10.times {@organization.organization_users.build}
  end

  # GET /organizations/1/edit
  def edit
    list = @organization.organization_users.pluck(:user_id).uniq
    if list.count<5
      5.times {@organization.organization_users.build}
    else
      list.count.times {@organization.organization_users.build}
    end
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

    #@my_org_participants.each do |user|
    #  user.destroy
    #   end


    @organization.destroy
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
      params.require(:organization).permit(:name, :description, :banner,:place, :organization_users_attributes => [:user_id,:organization_id])
      #params.fetch(:organization_users,{}).permit(:user_id,:organization_id)
    end
end
