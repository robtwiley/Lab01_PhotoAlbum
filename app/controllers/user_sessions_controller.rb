class UserSessionsController < ApplicationController
  
  #Method from declarative_authorization to identify access to 
  #functionality.  Uses config/authorization_rules.rb to know access rights.
  filter_resource_access

  # GET /user_sessions
  # GET /user_sessions.xml
  def index
    @user_sessions = UserSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_sessions }
    end
  end

  # GET /user_sessions/1
  # GET /user_sessions/1.xml
  def show
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user_session = UserSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # GET /user_sessions/1/edit
  def edit
    	# User authlogic current_user helper method in Application controller
	    #@user_session = UserSession.find(params[:id])
		###@user_session = current_user
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to(root_url, :notice => 'Successfully logged in.') }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_sessions/1
  # PUT /user_sessions/1.xml
  def update
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user_session = UserSession.find(params[:id])

    respond_to do |format|
      if @user_session.update_attributes(params[:user_session])
        format.html { redirect_to(@user_session, :notice => 'User session was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@user_session = UserSession.find(params[:id])
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to(root_url, :notice => 'Successfully logged out.') }
      format.xml  { head :ok }
    end
  end
end
