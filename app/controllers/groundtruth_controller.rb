class GroundtruthController < ApplicationController
  def answer
    puts request.to_s
    puts "is get #{request.get?}"
    puts "is put #{request.put?}"
    puts "is post #{request.post?}"
    if request.get?
      @user = current_user
      if session[:groundtruthing_response].nil?
        puts "null"
        @annotation_task = AnnotationTask.get_needy_annotation_task(@user)
        if not @annotation_task.nil? # any need to be done?
          @response = @annotation_task.responses.build
          @response.user = @user
          @scene = @annotation_task.scene
          session[:groundtruthing_response] = @response
        else # no annotation task found
          redirect_to home_path
        end
      else # session contains current response
        @response = session[:groundtruthing_response]
        @annotation_task = @response.annotation_task
        @scene = @annotation_task.scene
      end
    else
      puts "post?"
      @response = session[:groundtruthing_response]
      @response.answer = params[:answer]
      if @response.save
        session[:groundtruthing_response] = nil
        redirect_to(:answer, :notice => 'Thanks for your answer')
      else
        render :action => :answer
      end
    end
  end
end
