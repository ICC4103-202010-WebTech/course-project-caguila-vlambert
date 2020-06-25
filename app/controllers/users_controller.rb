class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :del]
 
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def search
    @users =User.where("name like ?", "%#{params[:q]}%")
  end
  def tos
  end
  def tus
  end
  def show_search
    @user= User.where(id:params[:search]).first
    @invites = Invite.where(target_id:@user.id)
    @is_boolean = ""
    if(@user.admin)
      @is_boolean = "This user is admin"
    else
      @is_boolean = "This user is not an admin"
    end
    @this_user_vents = Event.where(user_id:@user.id)
  end
  # GET /users/1
  # GET /users/1.json
  def show
    @invites = Invite.where(target_id:@user.id)
    @is_boolean = ""
    if(@user.admin)
      @is_boolean = "This user is admin"
    else
      @is_boolean = "This user is not an admin"
    end
    @this_user_vents = Event.where(user_id:@user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  def link_sign
    @user = User.new
  end
  def sign
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        bypass_sign_in(@user)
        format.html { redirect_to root_path, notice: 'Please log in in order to Access all the fetures of this User' }
        format.json { render :show, status: :created, location: @user }
      else
        puts("no se logroooooooo")
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Please log in in order to Access all the fetures of this User' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def del 
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      us = current_user
      if @user.update(user_params)
        if current_user
          if current_user.id == @user.id
            sign_out(current_user)
            bypass_sign_in(@user)
          else
            sign_out(current_user)
            bypass_sign_in(us)
          end
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:id,:admin, :name, :location, :bio,:password,:email)
    end
end
