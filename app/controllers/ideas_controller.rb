class IdeasController < ApplicationController

  before_filter :authenticate

  before_filter :authorized_user, :only => :destroy

  #  before_filter :find_user , :only => [:index, :new]
  # GET /ideas
  # GET /ideas.xml
  def index
    @ideas = current_user.ideas
    #@user.ideas

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.xml
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.xml
  def new
    @idea = current_user.ideas.new
    #@user.ideas.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.xml
  def create

    @idea = current_user.ideas.build(params[:idea])
    #@idea = Idea.new(params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { 
          #redirect_to(@idea, :notice => 'Idea was successfully created.')

          redirect_to ideas_path, :flash => { :success => "Idea created!" }
          #(:user_id => current_user.id)
        }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.xml
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to(@idea, :notice => 'Idea was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.xml
  #def destroy
    #@idea = Idea.find(params[:id])
    #@idea.destroy

    #respond_to do |format|
      #format.html { redirect_to(ideas_url) }
      #format.xml  { head :ok }
    #end
  #end
  def destroy
    @idea.destroy
    redirect_to ideas_path, :flash => { :success => "Idea deleted!" }
  end
  private
  def find_user
    @user = User.find(params[:user_id])
  end


  def authorized_user
    @idea = current_user.ideas.find_by_id(params[:id])
    redirect_to root_path if @idea.nil?
  end
end
