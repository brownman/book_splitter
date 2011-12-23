class SmartsController < ApplicationController

  include SmartsHelper

  #before_filter :find_user , :only => [:index, :new]

  before_filter :authenticate

  before_filter :authorized_user, :only => :destroy


  # GET /smarts
  # GET /smarts.xml
  def index
    @smarts = current_user.smarts
    #Smart.all
    @smart = Smart.new(:user_id => @user.id)
    @smarts.each do |smart|

      begin  
        obj =     eval(smart.question)

        smart.answer = (obj).to_s
      rescue Exception => e  
        puts e.message  
        puts e.backtrace.inspect  

        smart.answer = e.message
      end  




    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @smarts }
    end
  end

  # GET /smarts/1
  # GET /smarts/1.xml
  def show
    @smart = Smart.find(params[:id])
    obj = eval(@smart.question)

    @smart.answer = (obj).to_s
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @smart }
    end
  end

  # GET /smarts/new
  # GET /smarts/new.xml
  def new
    @smart = current_user.smarts.new
    #Smart.new


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @smart }
    end
  end

  # GET /smarts/1/edit
  def edit
    @smart = Smart.find(params[:id])
  end

  # POST /smarts
  # POST /smarts.xml
  def create
    @smart = current_user.smarts.build(params[:smart])
    #@smart = Smart.new(params[:smart])

    #@user = User.find(params[:smart][:user_id])
    #@smarts = @user.smarts

    respond_to do |format|

      if @smart.save



        @smart = Smart.new(:user_id =>  current_user.id)
   format.html {

          redirect_to smarts_path, :flash => { :success => "smart created!" } }
       #format.html { redirect_to( smarts_path  ,    :notice => "smart created" )  }
        #(:user_id => @user.id

        #(@smart, :notice => 'Smart was successfully created.')
        format.xml  { render :xml => @smart, :status => :created, :location => @smart }
        format.js
        puts 'SAVED!'
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @smart.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /smarts/1
  # PUT /smarts/1.xml
  def update
    @smart = Smart.find(params[:id])

    respond_to do |format|
      if @smart.update_attributes(params[:smart])
        format.html { redirect_to(@smart, :notice => 'Smart was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @smart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /smarts/1
  # DELETE /smarts/1.xml
  def destroy
    @smart.destroy
    redirect_to smarts_path, :flash => { :success => "Smart deleted!" }


    #@smart = Smart.find(params[:id])
    #@smart.destroy
    #Smart.all.each do |smart|
    #smart.destroy
    #end

    #respond_to do |format|
    #format.html { redirect_to(smarts_url) }
    #format.xml  { head :ok }
    #end


  end


  private
  def find_user
    #   @user = User.find(params[:user_id])
  end

  def authorized_user
    @smart = current_user.smarts.find_by_id(params[:id])
    redirect_to root_path if @smart.nil?
  end
end
