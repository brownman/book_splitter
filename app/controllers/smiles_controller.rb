class SmilesController < ApplicationController
  before_filter :authenticate

  before_filter :authorized_user, :only => [:destroy, :edit]

  # GET /smiles
  # GET /smiles.xml
  def index
    @smiles = current_user.smiles.all

    @smile = current_user.smiles.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @smiles }
    end
  end

  # GET /smiles/1
  # GET /smiles/1.xml
  def show
    @smile = Smile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @smile }
    end
  end

  # GET /smiles/new
  # GET /smiles/new.xml
  def new
    @smile = current_user.smiles.new
    #Smile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @smile }
    end
  end

  # GET /smiles/1/edit
  def edit

  #  @smile = current_user.smiles.
    @smile = current_user.smiles.find(params[:id])
  end

  # POST /smiles
  # POST /smiles.xml
  def create
    @smile = Smile.new(params[:smile])
    @smiles = current_user.smiles


    respond_to do |format|


      if @smile.save


        @smile = Smile.new(:user_id => current_user.id)
        format.html { redirect_to(smiles_path, :notice => 'Smile was successfully created.') }
        format.xml  { render :xml => @smile, :status => :created, :location => @smile }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @smile.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /smiles/1
  # PUT /smiles/1.xml
  def update
    @smile = Smile.find(params[:id])

    respond_to do |format|
      if @smile.update_attributes(params[:smile])
        format.html { redirect_to(smiles_path, :notice => 'Smile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @smile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /smiles/1
  # DELETE /smiles/1.xml
  def destroy1
    @smile = Smile.find(params[:id])
    @smile.destroy

    respond_to do |format|
      format.html { redirect_to(smiles_url) }
      format.xml  { head :ok }
    end
  end
  def destroy
    @smile.destroy
    redirect_to smiles_path, :flash => { :success => "Smile deleted!" }
  end




  private 
  def find_user
    #@user = User.find(params[:user_id])
  end


  def authorized_user
    @smile = current_user.smiles.find_by_id(params[:id])
    redirect_to root_path if @smile.nil?
  end
end
