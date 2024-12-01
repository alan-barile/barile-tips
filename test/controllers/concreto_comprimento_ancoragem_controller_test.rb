require "test_helper"

class ConcretoComprimentoAncoragemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get concreto_comprimento_ancoragem_index_url
    assert_response :success
  end
end
