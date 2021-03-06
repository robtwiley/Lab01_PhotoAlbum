class PhotosController < ApplicationController
	
   #Method from declarative_authorization to identify access to 
   #functionality.  Uses config/authorization_rules.rb to know access rights.
   filter_resource_access
   
   before_filter :load_album
   
   def load_album
      @album = Album.find params[:album_id]
   end 
	
  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    ###@photo = Photo.new(params[:photo])
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@photo = @album.photos.build(params[:photo])

    respond_to do |format|
      if @photo.save
        ###format.html { redirect_to(@photo, :notice => 'Photo was successfully created.') }
	format.html { redirect_to([@album,@photo], :notice => 'Photo was successfully created.') }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        ###format.html { redirect_to(@photo, :notice => 'Photo was successfully updated.') }
	format.html { redirect_to([@album,@photo], :notice => 'Photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    ###Access handled through declarative_authorization's before_filter in application_controller.rb
	###@photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(album_photos_url(@album)) }
      format.xml  { head :ok }
    end
  end
end
