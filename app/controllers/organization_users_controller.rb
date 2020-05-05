class OrganizationUsersController < ApplicationController
  before_action :set_organization_user, only: [:show, :edit, :update, :destroy]


  # GET /organization_users.json
  def index
    @organization_users = OrganizationUser.where(user_id:1)
  end

  # GET /organization_users/1
  # GET /organization_users/1.json
  def show
  end

  # GET /organization_users/new
  def new
    @organization_user = OrganizationUser.new
  end

  # GET /organization_users/1/edit
  def edit
  end

  # POST /organization_users
  # POST /organization_users.json
  def create
    @organization_user = OrganizationUser.new(organization_user_params)

    respond_to do |format|
      if @organization_user.save
        format.html { redirect_to @organization_user, notice: 'Organization user was successfully created.' }
        format.json { render :show, status: :created, location: @organization_user }
      else
        format.html { render :new }
        format.json { render json: @organization_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_users/1
  # PATCH/PUT /organization_users/1.json
  def update
    respond_to do |format|
      if @organization_user.update(organization_user_params)
        format.html { redirect_to @organization_user, notice: 'Organization user was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization_user }
      else
        format.html { render :edit }
        format.json { render json: @organization_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_users/1
  # DELETE /organization_users/1.json
  def destroy
    @organization_user.destroy
    respond_to do |format|
      format.html { redirect_to organization_users_url, notice: 'Organization user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_user
      @organization_user = OrganizationUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_user_params
      params.fetch(:organization_user, {})
    end
end
