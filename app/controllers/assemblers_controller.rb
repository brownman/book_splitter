class AssemblersController < ApplicationController
  before_filter :authenticate

  before_filter :authorized_user, :only => :destroy


  # GET /assemblers
  # GET /assemblers.xml
  def index
    @assemblers = current_user.assemblers

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assemblers }
    end
  end

  # GET /assemblers/1
  # GET /assemblers/1.xml
  def show
    @assembler = Assembler.find(params[:id])

@quizes = @assembler.quizes
@quize = @assembler.quizes.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assembler }
    end
  end

  # GET /assemblers/new
  # GET /assemblers/new.xml
  def new

      @assembler = current_user.assemblers.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assembler }
    end
  end

  # GET /assemblers/1/edit
  def edit
    @assembler = Assembler.find(params[:id])
  end

  # POST /assemblers
  # POST /assemblers.xml
  def create

    @assembler = current_user.assemblers.new(params[:assembler])
    



    respond_to do |format|
      if @assembler.save

        format.html { redirect_to(assemblers_path, :flash => {:success => 'assembler created.'}) }
        format.xml  { render :xml => @assembler, :status => :created, :location => @assembler }

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assembler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assemblers/1
  # PUT /assemblers/1.xml
  def update
    @assembler = Assembler.find(params[:id])

    respond_to do |format|
      if @assembler.update_attributes(params[:assembler])
        format.html { redirect_to(@assembler, :notice => 'Assembler was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assembler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assemblers/1
  #
  # DELETE /assemblers/1.xml
  def destroy
    #@assembler = Assembler.find(params[:id])
    @assembler.destroy


    respond_to do |format|
      format.html { 
    redirect_to assemblers_path, :flash => { :success => "Assembler deleted!" }
      }
      format.xml  { head :ok }
    end
  end
  private
  def find_user
    #@user = User.find(params[:user_id])
  end
  def authorized_user
    @assembler = current_user.assemblers.find_by_id(params[:id])
    redirect_to root_path if @assembler.nil?
  end
end
