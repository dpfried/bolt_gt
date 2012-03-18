class GroundtruthController < ApplicationController
  def answer
    puts request.to_s
    puts "is get #{request.get?}"
    puts "is put #{request.put?}"
    puts "is post #{request.post?}"
    if request.get?
      @user = current_user
      if session[:groundtruthing_response].nil?
        # find a task that needs doing
        @annotation_task = AnnotationTask.get_needy_annotation_task(@user)
        if not @annotation_task.nil? # any need to be done?
          @scene = @annotation_task.scene
          # Don't actually generate the reponse, but store the annotation task id and user id
          session[:groundtruthing_response] = {:annotation_task => @annotation_task.id, :user => @user.id}
        else # no annotation task found
          render :action => 'complete'
        end
      else # session contains info about response that needs completing
        @annotation_task = AnnotationTask.find_by_id(session[:groundtruthing_response][:annotation_task])
        @scene = @annotation_task.scene
        @user = User.find_by_id(session[:groundtruthing_response][:user])
      end
    else
      # posting the response
      @annotation_task = AnnotationTask.find_by_id(session[:groundtruthing_response][:annotation_task])
      @scene = @annotation_task.scene
      @response = @annotation_task.responses.build
      @response.user = User.find_by_id(session[:groundtruthing_response][:user])
      @response.answer = params[:answer]
      if @response.save
        session[:groundtruthing_response] = nil
        redirect_to(:answer, :notice => 'Thanks for your answer')
      else
        @errors = @response.errors
        render :action => :answer
      end
    end
  end

  def complete
  end
end
