require "test_helper"

class SugestoesLivrosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sugestoes_livros_index_url
    assert_response :success
  end
end
