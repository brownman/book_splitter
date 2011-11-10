class QuizesController < ApplicationController
  # GET /quizes
  # GET /quizes.xml
  def index
    @quizes = Quize.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quizes }
    end
  end

  # GET /quizes/1
  # GET /quizes/1.xml
  def show
    @quize = Quize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quize }
    end
  end

  # GET /quizes/new
  # GET /quizes/new.xml
  def new
    @quize = Quize.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quize }
    end
  end

  # GET /quizes/1/edit
  def edit
    @quize = Quize.find(params[:id])
  end

  # POST /quizes
  # POST /quizes.xml
  def create
    @quize = Quize.new(params[:quize])

    respond_to do |format|
      if @quize.save
        format.html { redirect_to(@quize, :notice => 'Quize was successfully created.') }
        format.xml  { render :xml => @quize, :status => :created, :location => @quize }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quize.errors, :status => :unprocessable_entity }
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
  def destroy
    @quize = Quize.find(params[:id])
    @quize.destroy

    respond_to do |format|
      format.html { redirect_to(quizes_url) }
      format.xml  { head :ok }
    end
  end
end
