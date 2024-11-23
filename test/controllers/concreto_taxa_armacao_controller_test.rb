require "test_helper"

class ConcretoTaxaArmacaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get concreto_taxa_armacao_index_url
    assert_response :success
  end
end
