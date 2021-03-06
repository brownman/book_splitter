class DraftsController < ApplicationController

  before_filter :find_compare , :only => [:index, :new]
  before_filter :authenticate

  before_filter :authorized_user, :only => [:destroy, :edit]
  # GET /drafts
  # GET /drafts.xml
  def index
    @drafts = @compare.drafts.reorder('id')
    #order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drafts }
    end
  end

  # GET /drafts/1
  # GET /drafts/1.xml
  def show
    @draft = Draft.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @draft }
    end
  end

  # GET /drafts/new
  # GET /drafts/new.xml
  def new
    @draft = @compare.drafts.build 

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @draft }
    end
  end

  # GET /drafts/1/edit
  def edit
    @draft = Draft.find(params[:id])
  end

  # POST /drafts
  # POST /drafts.xml
  def create
    @draft = Draft.new(params[:draft])

    respond_to do |format|
      if @draft.save
        format.html { redirect_to(compare_path(:id => @draft.compare_id), :flash => { :success => 'draft created.'}) }
        format.xml  { render :xml => @draft, :status => :created, :location => @draft }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @draft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drafts/1
  # PUT /drafts/1.xml
  def update
    @draft = Draft.find(params[:id])

    respond_to do |format|
      if @draft.update_attributes(params[:draft])
        format.html { redirect_to(@draft, :notice => 'Draft was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @draft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drafts/1
  # DELETE /drafts/1.xml
  def destroy1
    @draft = Draft.find(params[:id])
    @draft.destroy

    respond_to do |format|
      format.html {  redirect_to(
           # @draft.compare_id  , 
            compare_path(:id => @draft.compare_id ),
            :notice => 'Draft was successfully deleted.'
                     )
        }

      format.xml  { head :ok }
    end
  end
    def destroy

 @draft.destroy
    redirect_to drafts_path, :flash => { :success => "Draft deleted!" }

  end
  def push
@draft = Draft.find(params[:id])
#indexes = []
#indexes <<
str = params[:item2]
puts str
puts "OK OK "

@draft.content = str 
#+ str 

    respond_to do |format|
      if @draft.save
@last_save = Time.now - @draft.updated_at 
puts @last_save
        format.html { 
          redirect_to(
           # @draft.compare_id  , 
            compare_path(:id => @draft.compare_id ),
            :notice => 'Draft was successfully created.'
                     )
        }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end
  private
  def find_compare
    @compare = Compare.find(params[:compare_id])
  end
  def authorized_user

   current_user.compares.each do |compare| 
      found = compare.drafts.find_by_id(params[:id])
      @draft = found if found  
    end
    redirect_to root_path if @draft.nil?
  end
end
