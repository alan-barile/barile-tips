require "test_helper"

class AcoTabelaPerfilLaminadoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aco_tabela_perfil_laminado_index_url
    assert_response :success
  end
end
