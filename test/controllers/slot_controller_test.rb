require 'test_helper'

class SlotControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slot_index_url
    assert_response :success
  end

end
