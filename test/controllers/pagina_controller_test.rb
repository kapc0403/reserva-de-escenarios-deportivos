require 'test_helper'

class PaginaControllerTest < ActionController::TestCase
  test "should get Inicio" do
    get :Inicio
    assert_response :success
  end

  test "should get Nosotros" do
    get :Nosotros
    assert_response :success
  end

  test "should get Contacto" do
    get :Contacto
    assert_response :success
  end

end
