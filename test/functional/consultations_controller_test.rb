require 'test_helper'

class ConsultationsControllerTest < ActionController::TestCase
  setup do
    @consultation = consultations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultation" do
    assert_difference('Consultation.count') do
      post :create, consultation: @consultation.attributes
    end

    assert_redirected_to consultation_path(assigns(:consultation))
  end

  test "should show consultation" do
    get :show, id: @consultation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consultation.to_param
    assert_response :success
  end

  test "should update consultation" do
    put :update, id: @consultation.to_param, consultation: @consultation.attributes
    assert_redirected_to consultation_path(assigns(:consultation))
  end

  test "should destroy consultation" do
    assert_difference('Consultation.count', -1) do
      delete :destroy, id: @consultation.to_param
    end

    assert_redirected_to consultations_path
  end
end
