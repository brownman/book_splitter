class ComparesController < ApplicationController
  before_filter :find_user , :only => [:index, :new]

#  before_filter :find_chapter , :only => [:index]
  # GET /compares
  # GET /compares.xml
  def index
  @compares = @user.compares
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @compares }
    end
  end

  # GET /compares/1
  # GET /compares/1.xml
  def show
    @compare = Compare.find(params[:id])
@drafts = @compare.drafts
@quizes = @compare.quizes


    @quize = @compare.quizes.new
  #(:compare_id => @compare.id )
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @compare }
    end
  end

  # GET /compares/new
  # GET /compares/new.xml
  def new
      @compare = @user.compares.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @compare }
    end
  end

  # GET /compares/1/edit
  def edit
    @compare = Compare.find(params[:id])
  end

  # POST /compares
  # POST /compares.xml
  def create
    @compare = Compare.new(params[:compare])

    respond_to do |format|
      if @compare.save
        format.html { redirect_to(@compare, :notice => 'Compare was successfully created.') }
        format.xml  { render :xml => @compare, :status => :created, :location => @compare }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @compare.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /compares/1
  # PUT /compares/1.xml
  def update
    @compare = Compare.find(params[:id])

    respond_to do |format|
      if @compare.update_attributes(params[:compare])
        format.html { redirect_to(@compare, :notice => 'Compare was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @compare.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /compares/1
  # DELETE /compares/1.xml
  def destroy
    @compare = Compare.find(params[:id])
    @compare.destroy

    respond_to do |format|
      format.html { redirect_to(compares_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def find_user
    @user = User.find(params[:user_id])
  end

end
