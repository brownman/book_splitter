class BravesController < ApplicationController
  # GET /braves
  # GET /braves.xml
  def index
    @braves = Brave.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @braves }
    end
  end

  # GET /braves/1
  # GET /braves/1.xml
  def show
    @brafe = Brave.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brafe }
    end
  end

  # GET /braves/new
  # GET /braves/new.xml
  def new
    @brafe = Brave.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brafe }
    end
  end

  # GET /braves/1/edit
  def edit
    @brafe = Brave.find(params[:id])
  end

  # POST /braves
  # POST /braves.xml
  def create
    @brafe = Brave.new(params[:brafe])

    respond_to do |format|
      if @brafe.save
        format.html { redirect_to(@brafe, :notice => 'Brave was successfully created.') }
        format.xml  { render :xml => @brafe, :status => :created, :location => @brafe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brafe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /braves/1
  # PUT /braves/1.xml
  def update
    @brafe = Brave.find(params[:id])

    respond_to do |format|
      if @brafe.update_attributes(params[:brafe])
        format.html { redirect_to(@brafe, :notice => 'Brave was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brafe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /braves/1
  # DELETE /braves/1.xml
  def destroy
    @brafe = Brave.find(params[:id])
    @brafe.destroy

    respond_to do |format|
      format.html { redirect_to(braves_url) }
      format.xml  { head :ok }
    end
  end
end
