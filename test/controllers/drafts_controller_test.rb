# frozen_string_literal: true

require 'test_helper'

class DraftsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get drafts_index_url
    assert_response :success
  end
end
