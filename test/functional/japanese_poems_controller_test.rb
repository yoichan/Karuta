require 'test_helper'

class JapanesePoemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get play_game" do
    get :play_game
    assert_response :success
  end

  test "should get check_answer" do
    get :check_answer
    assert_response :success
  end

end
