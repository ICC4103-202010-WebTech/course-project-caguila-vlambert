class RegistrationsController < Devise::RegistrationsController
    skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
  
    protected
  
    def create
      User.create!({:email => params[:email], :roles => [''], :password => params[:password], :password_confirmation => params[:password_confirmation] })
    end
  
    def sign_up(resource_name, resource)
    end
  end