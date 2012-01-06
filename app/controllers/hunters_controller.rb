class HuntersController < ApplicationController
  #before_filter :find_user , :only => [:index, :new]

  before_filter :authenticate

  before_filter :authorized_user, :only => :destroy



  # GET /hunters
  # GET /hunters.xml
  def index
    @hunters = current_user.hunters
    @hunter = current_user.hunters.new
#@hunters.times do |hunter|
  
 #Regexp.new()
#end



    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hunters }
    end
  end

  # GET /hunters/1
  # GET /hunters/1.xml
  def show
    @hunter = current_user.hunters.find(params[:id])
#regexp =  Regexp.new @hunter.regexp

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hunter }
    end
  end

  # GET /hunters/new
  # GET /hunters/new.xml
  def new
    @hunter = current_user.hunters.build
    #Hunter.bd 
    #new#(:user_id => current_user.id) 
#Hunter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hunter }
    end
  end

  # GET /hunters/1/edit
  def edit
    @hunter = current_user.hunters.find(params[:id])
  end

  # POST /hunters
  # POST /hunters.xml
  def create
    @hunter =   Hunter.new(params[:hunter])

      #current_user.hunters.build 
  
    respond_to do |format|
      if @hunter.save
        format.html { redirect_to(hunters_path, :notice => 'Hunter was successfully created.') }
        format.xml  { render :xml => @hunter, :status => :created, :location => @hunter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hunter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hunters/1
  # PUT /hunters/1.xml
  def update
    @hunter = current_user.hunters.find(params[:id])

    respond_to do |format|
      if @hunter.update_attributes(params[:hunter])
        format.html { redirect_to(@hunter, :notice => 'Hunter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hunter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hunters/1
  # DELETE /hunters/1.xml
  def destroy1
    @hunter = Hunter.find(params[:id])
    @hunter.destroy

    respond_to do |format|
      format.html { redirect_to(hunters_url) }
      format.xml  { head :ok }
    end
  end
  def destroy
    @hunter.destroy
    redirect_to hunters_path, :flash => { :success => "hunter deleted!" }
  end
  private
  def find_user
    #   @user = User.find(params[:user_id])
  end

  def authorized_user
    @hunter = current_user.hunters.find_by_id(params[:id])
    redirect_to root_path if @hunter.nil?
  end
end
