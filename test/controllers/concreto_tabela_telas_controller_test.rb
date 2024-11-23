require "test_helper"

class ConcretoTabelaTelasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get concreto_tabela_telas_index_url
    assert_response :success
  end
end
