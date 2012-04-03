class GroundtruthController < ApplicationController
  def answer
    puts request.to_s
    if request.get?
      @user = current_user
      # check to store if the current scene is stored in the session
      if session[:groundtruthing_response].nil?
        # find a scene that needs annotating
        @scene = @user.get_needy_scene
        if not @scene.nil? and not @scene.sequence.nil? # any need to be done?
          # Don't actually generate the reponse, but store the annotation task id and user id
          session[:groundtruthing_response] = {:scene => @scene.id, :user => @user.id}
        end
      else # session contains info about scene that needs annotating
        @scene = Scene.find_by_id(session[:groundtruthing_response][:scene])
        @user = User.find_by_id(session[:groundtruthing_response][:user])
      end
      if not @scene.nil? and not @scene.sequence.nil? # any need to be done?
        sequence = @scene.sequence
        sorted_scenes = sequence.scenes.sort{|a,b| a.id <=> b.id}
        index_of_scene_in_sequence = sorted_scenes.index(@scene)
        @is_first_scene_in_sequence = (index_of_scene_in_sequence == 0)
        if not @is_first_scene_in_sequence
          @past_scene = sorted_scenes.fetch(index_of_scene_in_sequence - 1)
        end
      else # no annotation task found
        render :action => 'complete'
      end
    else
      # posting the response
      @annotation_task = AnnotationTask.find_by_id(session[:groundtruthing_response][:annotation_task])
      @scene = Scene.find_by_id(session[:groundtruthing_response][:scene])
      @response = @scene.responses.build
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
