class AnnotationTasksController < ApplicationController
  before_filter :authenticate_admin

  # GET /annotation_tasks
  # GET /annotation_tasks.xml
  def index
    @annotation_tasks = AnnotationTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @annotation_tasks }
    end
  end

  # GET /annotation_tasks/1
  # GET /annotation_tasks/1.xml
  def show
    @annotation_task = AnnotationTask.find(params[:id])
    @scene = @annotation_task.scene
    @responses = @annotation_task.responses

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @annotation_task }
    end
  end

  # GET /annotation_tasks/new
  # GET /annotation_tasks/new.xml
  def new
    @annotation_task = AnnotationTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @annotation_task }
    end
  end

  # GET /annotation_tasks/1/edit
  def edit
    @annotation_task = AnnotationTask.find(params[:id])
  end

  # POST /annotation_tasks
  # POST /annotation_tasks.xml
  def create
    @annotation_task = AnnotationTask.new(params[:annotation_task])

    respond_to do |format|
      if @annotation_task.save
        format.html { redirect_to(@annotation_task, :notice => 'Annotation task was successfully created.') }
        format.xml  { render :xml => @annotation_task, :status => :created, :location => @annotation_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @annotation_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /annotation_tasks/1
  # PUT /annotation_tasks/1.xml
  def update
    @annotation_task = AnnotationTask.find(params[:id])

    respond_to do |format|
      if @annotation_task.update_attributes(params[:annotation_task])
        format.html { redirect_to(@annotation_task, :notice => 'Annotation task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @annotation_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /annotation_tasks/1
  # DELETE /annotation_tasks/1.xml
  def destroy
    @annotation_task = AnnotationTask.find(params[:id])
    @annotation_task.destroy

    respond_to do |format|
      format.html { redirect_to(annotation_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
