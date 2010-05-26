class PluginsController < ApplicationController

  filter_resource_access

  # GET /plugins
  # GET /plugins.xml
  def index
    if params[:q].present? && params[:q].length >= 3
      @plugins = Plugin.search params[:q], :star => true,
                                           :page => (params[:page] || 1)
    else
      flash[:notice] = "Zu kurzer Suchbegriff" if params[:q].present?
      @plugins = Plugin.paginate :page => (params[:page] || 1),
                                  :order => 'name ASC'
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plugins }
    end
  end

  # GET /plugins/1
  # GET /plugins/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plugin }
    end
  end

  # GET /plugins/new
  # GET /plugins/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plugin }
    end
  end

  # GET /plugins/1/edit
  def edit
  end

  # POST /plugins
  # POST /plugins.xml
  def create
    @plugin = Plugin.from_zip params[:zip]
    respond_to do |format|
      if @plugin.errors.empty?
        current_user.plugins << @plugin
        flash[:notice] = 'Plugin was successfully created.'
        format.html { redirect_to(@plugin) }
        format.xml  { render :xml => @plugin, :status => :created, :location => @plugin }
      else
        flash[:error] = "Plugin could not be created."
        format.html { render :action => "new" }
        format.xml  { render :xml => @plugin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plugins/1
  # PUT /plugins/1.xml
  def update
    respond_to do |format|
      if @plugin.update_attributes(params[:plugin])
        flash[:notice] = 'Plugin was successfully updated.'
        format.html { redirect_to(@plugin) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plugin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plugins/1
  # DELETE /plugins/1.xml
  def destroy
    @plugin.destroy

    respond_to do |format|
      format.html { redirect_to(plugins_url) }
      format.xml  { head :ok }
    end
  end
end
