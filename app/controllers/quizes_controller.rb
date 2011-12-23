class QuizesController < ApplicationController

  before_filter :find_compare , :only => [:index, :new]
  before_filter :authenticate

  before_filter :authorized_user, :only => [:destroy, :edit]


  # GET /quizes
  # GET /quizes.xml
  def index
    @quizes = @compare.quizes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quizes }
    end
  end

  # GET /quizes/1
  # GET /quizes/1.xml
  def show
    @quize = @compare.quizes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quize }
    end
  end

  # GET /quizes/new
  # GET /quizes/new.xml
  def new
    @quize = @compare.quizes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quize }
    end
  end

  # GET /quizes/1/edit
  def edit
    @quize = @compare.find(params[:id])
  end

  # POST /quizes
  # POST /quizes.xml
  def create
    @quize = Quize.new(params[:quize])

    @compare = Compare.find(params[:quize][:compare_id])
    @quizes = @compare.quizes

    respond_to do |format|

      if @quize.save

        @quize = Quize.new(:compare_id => @compare.id)
        format.html { redirect_to quizes_path, :flash => { :success => "quize created!" } }

        format.xml  { render :xml => @quize, :status => :created, :location => @quize }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quize.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /quizes/1
  # PUT /quizes/1.xml
  def update
    @quize = Quize.find(params[:id])

    respond_to do |format|
      if @quize.update_attributes(params[:quize])
        format.html { redirect_to(@quize, :notice => 'Quize was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quize.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quizes/1
  # DELETE /quizes/1.xml
  def destroy1
    @quize = Quize.find(params[:id])
    @quize.destroy

    respond_to do |format|
      format.html { redirect_to(quizes_url) }
      format.xml  { head :ok }
    end
  end
  def destroy
    #@line = Line.find(params[:id])
    #@line.destroy

    #respond_to do |format|
      #format.html { redirect_to(lines_url) }
      #format.xml  { head :ok }
    #end
 @quize.destroy
    redirect_to quizes_path, :flash => { :success => "Quize deleted!" }

  end
  private
  def find_compare
    @compare = Compare.find(params[:compare_id])
  end
  def authorized_user

   current_user.compares.each do |compare| 
      found = compare.quizes.find_by_id(params[:id])
      @quize = found if found  
    end
    redirect_to root_path if @quize.nil?
  end
end
