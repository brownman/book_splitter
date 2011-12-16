class LinesController < ApplicationController

  include LinesHelper

  before_filter :authenticate

  before_filter :authorized_user, :only => :destroy


 # before_filter :find_user , :only => [:new]
  # GET /lines
  # GET /lines.xml
  def index
    @lines = Line.all
   
# @line= Line.new
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
  #@line = Line.new

    @line = Line.new(

:parent_id => params[:parent_id]
)
#current_user.lines.new( :parent_id => params[:parent_id])
# , :user_id => params[:user_id] )


#@line.parent_id = params[:parent_id]
#@line.user_id = params[:user_id]
#@line.content = params[:parent_id]


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
    #@line = Line.new(params[:line])

    @line = current_user.lines.build(params[:line])
    respond_to do |format|
      if @line.save


if @line.parent_id

user_id = Line.find(@line.parent_id).user_id
@user_parent = User.find(user_id)
@user_parent.messages.create!(:line_id => @line.id)
end
        format.html {

          redirect_to lines_path, :flash => { :success => "line created!" } }
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
    #@line = Line.find(params[:id])
    #@line.destroy

    #respond_to do |format|
      #format.html { redirect_to(lines_url) }
      #format.xml  { head :ok }
    #end
 @line.destroy
    redirect_to lines_path, :flash => { :success => "Line deleted!" }

  end
 private
  def find_user
 #   @user = User.find(params[:user_id])
  end

  def authorized_user
    @line = current_user.lines.find_by_id(params[:id])
    redirect_to root_path if @line.nil?
  end
end
