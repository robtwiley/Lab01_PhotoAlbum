class UsersController < ApplicationController
  
  #Method from declarative_authorization to identify access to 
   #functionality.  Uses config/authorization_rules.rb to know access rights.
   filter_resource_access
  
  # GET /users
  # GET /users.xml
  def index
	@users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user = current_user
	###@user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    #@user = User.find(params[:id])
	# User authlogic current_user helper method in Application controller
	###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(root_url, :notice => 'Registration successful.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    #@user = User.find(params[:id])
	# User authlogic current_user helper method in Application controller
	###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(root_url, :notice => 'Successfully updated profile.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
