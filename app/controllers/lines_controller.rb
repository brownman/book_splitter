class LinesController < ApplicationController

  include LinesHelper

 # before_filter :find_user , :only => [:new]
  # GET /lines
  # GET /lines.xml
  def index
    @lines = Line.all
    @line= Line.new
      #@user.lines.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lines }
    end
  end

  # GET /lines/1
  # GET /lines/1.xml
  def show
    @line = Line.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line }
    end
  end

  # GET /lines/new
  # GET /lines/new.xml
  def new
#    @line = Line.new()
  @line = Line.new(:user_id => params[:user_id] , :parent_id => params[:parent_id])

    #build(params)
      #@user.lines.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line }
    end
  end

  # GET /lines/1/edit
  def edit
    @line = Line.find(params[:id])
  end

  # POST /lines
  # POST /lines.xml
  def create
    @line = Line.new(params[:line])

    respond_to do |format|
      if @line.save
        format.html { redirect_to(@line, :notice => 'Line was successfully created.') }
        format.xml  { render :xml => @line, :status => :created, :location => @line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lines/1
  # PUT /lines/1.xml
  def update
    @line = Line.find(params[:id])

    respond_to do |format|
      if @line.update_attributes(params[:line])
        format.html { redirect_to(@line, :notice => 'Line was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.xml
  def destroy
    @line = Line.find(params[:id])
    @line.destroy

    respond_to do |format|
      format.html { redirect_to(lines_url) }
      format.xml  { head :ok }
    end
  end
 private
  def find_user
    @user = User.find(params[:user_id])
  end

end