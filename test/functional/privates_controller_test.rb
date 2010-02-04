require File.dirname(__FILE__) + '/../test_helper'

class PrivatesControllerTest < ActionController::TestCase

	test "should get private page if authenticated as admin" do
		User.any_instance.stubs(:is_admin?).returns(true)
		log_in
		get :show
		assert_response :success
	end

	test "should NOT get private page if only authenticated" do
		log_in
		get :show
		assert_redirected_to root_path
		assert_not_nil flash[:error]
	end

	test "should NOT get private page if NOT authenticated" do
		get :show
		# https://auth-test.berkeley.edu/cas/login?service=http%3A%2F%2Ftest.host%2Faccounts%2F
		assert_response :redirect
		assert_match "https://auth-test.berkeley.edu/cas/login", @response.redirected_to
	end

end
