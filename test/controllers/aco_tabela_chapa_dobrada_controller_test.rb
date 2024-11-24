require "test_helper"

class AcoTabelaChapaDobradaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aco_tabela_chapa_dobrada_index_url
    assert_response :success
  end
end
