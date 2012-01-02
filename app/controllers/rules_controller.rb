class RulesController < ApplicationController


  #before_filter :find_user , :only => [:index, :new]

  before_filter :authenticate

  before_filter :authorized_user, :only => :destroy



  # GET /rules
  # GET /rules.xml
  def index
    @rules = current_user.rules.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rules }
    end
  end

  # GET /rules/1
  # GET /rules/1.xml
  def show
    @rule = current_user.rules.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rule }
    end
  end

  # GET /rules/new
  # GET /rules/new.xml
  def new
    @rule = current_user.rules.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rule }
    end
  end

  # GET /rules/1/edit
  def edit
    @rule = Rule.find(params[:id])
  end

  # POST /rules
  # POST /rules.xml
  def create
    @rule = Rule.new(params[:rule])

    respond_to do |format|
      if @rule.save
        format.html { redirect_to(@rule, :notice => 'Rule was successfully created.') }
        format.xml  { render :xml => @rule, :status => :created, :location => @rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rules/1
  # PUT /rules/1.xml
  def update
    @rule = Rule.find(params[:id])

    respond_to do |format|
      if @rule.update_attributes(params[:rule])
        format.html { redirect_to(@rule, :notice => 'Rule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.xml
  def destroy1
    @rule = Rule.find(params[:id])
    @rule.destroy

    respond_to do |format|
      format.html { redirect_to(rules_url) }
      format.xml  { head :ok }
    end
  end
  def destroy
    @rule.destroy
    redirect_to rules_path, :flash => { :success => "rule deleted!" }


    #@rule = rule.find(params[:id])
    #@rule.destroy
    #rule.all.each do |rule|
    #rule.destroy
    #end

    #respond_to do |format|
    #format.html { redirect_to(rules_url) }
    #format.xml  { head :ok }
    #end


  end


  private
  def find_user
    #   @user = User.find(params[:user_id])
  end

  def authorized_user
    @rule = current_user.rules.find_by_id(params[:id])
    redirect_to root_path if @rule.nil?
  end
end
