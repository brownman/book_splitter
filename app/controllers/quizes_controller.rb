class QuizesController < ApplicationController
#  before_filter :find_quizable , :only => [:index, :new, :update]
  before_filter :authenticate

  before_filter :authorized_user, :only => [:destroy, :edit]


  # GET /quizes
  # GET /quizes.xml

# quizes_controller
def index
  @quizable = find_quizable


    flash[:notice] =  'what is quizable? ' + @quizable.to_s
    #flash[:success] =  @quizable.to_s
    @quizes = @quizable.quizes
    @quize = @quizable.quizes.new
end

def create2
  
  #@quizeable = find_quizable
  @quize = Quize.new(params[:quize])

#obj = @quize.quizable_type 
#obj.constantize
#@quize.quizable_id

#    @quizable.quizes.
  #
     if @quize.save
    #flash[:notice] = "Successfully created quize."

    flash[:success] = "Successfully created quize."
    redirect_to :id => nil
  else
    render :action => 'new'
  end

     
end


  def index1
 @quizeable = find_quizeable
  @quizes = @quizeable.quizes

    @quizes = @quizable.quizes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quizes }
    end
  end

  # GET /quizes/1
  # GET /quizes/1.xml
  def show
 @quizable = find_quizable

    @quize = @quizable.quizes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quize }
    end
  end

  # GET /quizes/new
  # GET /quizes/new.xml
  def new
 @quizable = find_quizable

    @quize = @quizable.quizes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quize }
    end
  end

  # GET /quizes/1/edit
  def edit
    @quize = @quizable.find(params[:id])
  end

  # POST /quizes
  # POST /quizes.xml
  def create
    @paramss = find_params
 @quizable = find_quizable

    @quize = Quize.new(params[:quize])

    #@quizable = quizable.find(params[:quize][:quizable_id])
    #@quizes = @quizable.quizes
    
#class_name = @quize.quizable_type
#classify.constantize.

    respond_to do |format|

      if @quize.save

        @quize = @quizable.quizes.new
        @quizes = @quizable.quizes
        #(:quizable_id => @quizable.id)
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
    @quize = @quizable.quizes.find(params[:id])

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
def find_params
  params
end

def find_quizable
  
  puts params
  
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
end

#  def find_quizable
#    @quizable = quizable.find(params[:quizable_id])
#  end
  def authorized_user

   current_user.quizables.each do |quizable| 
      found = quizable.quizes.find_by_id(params[:id])
      @quize = found if found  
    end
    redirect_to root_path if @quize.nil?
  end
end
