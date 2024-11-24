require "test_helper"

class ConcretoComparacaoArmacaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get concreto_comparacao_armacao_index_url
    assert_response :success
  end
end
