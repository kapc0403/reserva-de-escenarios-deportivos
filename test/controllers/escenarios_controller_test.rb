require 'test_helper'

class EscenariosControllerTest < ActionController::TestCase
  setup do
    @escenario = escenarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:escenarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create escenario" do
    assert_difference('Escenario.count') do
      post :create, escenario: { categorium_id: @escenario.categorium_id, estado: @escenario.estado, nombre: @escenario.nombre }
    end

    assert_redirected_to escenario_path(assigns(:escenario))
  end

  test "should show escenario" do
    get :show, id: @escenario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @escenario
    assert_response :success
  end

  test "should update escenario" do
    patch :update, id: @escenario, escenario: { categorium_id: @escenario.categorium_id, estado: @escenario.estado, nombre: @escenario.nombre }
    assert_redirected_to escenario_path(assigns(:escenario))
  end

  test "should destroy escenario" do
    assert_difference('Escenario.count', -1) do
      delete :destroy, id: @escenario
    end

    assert_redirected_to escenarios_path
  end
end
