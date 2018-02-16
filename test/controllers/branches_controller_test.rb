require 'test_helper'

class BranchesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
    @branch = branches(:one)
  end

  test "should get index" do
    get branches_url
    assert_response :success
  end

  test "should get new" do
    get new_branch_url
    assert_response :success
  end

  test "should create branch" do
    assert_difference('Branch.count') do
      post branches_url, params: { branch: { address: @branch.address, credit_union_id: @branch.credit_union_id, full_name: @branch.full_name, short_name: "short_name" } }
    end

    assert_redirected_to branch_url(Branch.last)
  end

  test "should show branch" do
    get branch_url(@branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_branch_url(@branch)
    assert_response :success
  end

  test "should update branch" do
    patch branch_url(@branch), params: { branch: { address: @branch.address, credit_union_id: @branch.credit_union_id, full_name: @branch.full_name, short_name: @branch.short_name } }
    assert_redirected_to branch_url(@branch)
  end

  test "should destroy branch" do
    assert_difference('Branch.count', -1) do
      delete branch_url(@branch)
    end

    assert_redirected_to branches_url
  end
end
