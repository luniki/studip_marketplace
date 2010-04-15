class ReleasesController < ApplicationController

  filter_resource_access :nested_in => :plugins, :shallow => true

  # GET /releases
  # GET /releases.xml
  def index
    @releases = @plugin.releases

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @releases }
    end
  end

  # GET /releases/1
  # GET /releases/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @release }
    end
  end

  # GET /releases/new
  # GET /releases/new.xml
  def new
    @release = @plugin.releases.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @release }
    end
  end

  # POST /releases
  # POST /releases.xml
  def create
    respond_to do |format|
      if @release.save
        flash[:notice] = 'Release was successfully created.'
        format.html { redirect_to(@release) }
        format.xml  { render :xml => @release, :status => :created, :location => @release }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @release.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.xml
  def destroy
    plugin = @release.plugin
    @release.destroy
    respond_to do |format|
      format.html { redirect_to(plugin) }
      format.xml  { head :ok }
    end
  end
end
