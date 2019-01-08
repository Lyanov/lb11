require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get calculator_input_url
    assert_response :success
  end

  test "should get output" do
    get calculator_output_url
    assert_response :success
  end

end
