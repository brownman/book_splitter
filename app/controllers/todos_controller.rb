class TodosController < ApplicationController
  before_filter :authenticate

  before_filter :authorized_user, :only => :destroy


  #before_filter :find_user , :only => [:index, :new]
  # GET /todos
  # GET /todos.xml
  def index
  #  @todos = Todo.all

  @todos = current_user.todos
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.xml
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.xml
  def new
    @todo = current_user.todos.new
    #Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = current_user.todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.xml
  def create
    @todo = current_user.todos.new(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to(todos_path, :notice => 'Todo was successfully created.') }
        format.xml  { render :xml => @todo, :status => :created, :location => @todo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.xml
  def update
    @todo = current_user.todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to(@todo, :notice => 'Todo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.xml
  def destroy1
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to(todos_url) }
      format.xml  { head :ok }
    end
  end
  def destroy
    @todo.destroy
    redirect_to todos_path, :flash => { :success => "Todo deleted!" }
  end


  private
  def find_user
    @user = User.find(params[:user_id])
  end
  def authorized_user
    @todo = current_user.todos.find_by_id(params[:id])
    redirect_to root_path if @todo.nil?
  end
end
