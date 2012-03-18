class GroundtruthController < ApplicationController
  def answer
    if request.get?
      @user = current_user
      @annotation_task = AnnotationTask.get_needy_annotation_task(@user)
      if @annotation_task
        @response = @annotation_task.responses.build
        @response.user = @user
        @response.save
        @scene = @annotation_task.scene
        params[:response_id] = @response.id
      else
        redirect_to home_path
      end
    end

    if request.put?
      @response = Response.find(params[:response_id])
      respond_to do |format|
        if @response.update_attributes(params[:response])
          format.html { redirect_to(@response, :notice => 'Thanks for your answer') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
end
