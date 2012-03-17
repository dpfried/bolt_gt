require 'test_helper'

class AnnotationTasksControllerTest < ActionController::TestCase
  setup do
    @annotation_task = annotation_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:annotation_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create annotation_task" do
    assert_difference('AnnotationTask.count') do
      post :create, :annotation_task => @annotation_task.attributes
    end

    assert_redirected_to annotation_task_path(assigns(:annotation_task))
  end

  test "should show annotation_task" do
    get :show, :id => @annotation_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @annotation_task.to_param
    assert_response :success
  end

  test "should update annotation_task" do
    put :update, :id => @annotation_task.to_param, :annotation_task => @annotation_task.attributes
    assert_redirected_to annotation_task_path(assigns(:annotation_task))
  end

  test "should destroy annotation_task" do
    assert_difference('AnnotationTask.count', -1) do
      delete :destroy, :id => @annotation_task.to_param
    end

    assert_redirected_to annotation_tasks_path
  end
end
