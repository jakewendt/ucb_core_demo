require File.dirname(__FILE__) + '/../test_helper'

class LdapsControllerTest < ActionController::TestCase

	test "should get ldap info if authenticated" do
		log_in
		get :show
		assert_response :success
	end

	test "should NOT get ldap info if NOT authenticated" do
		get :show
		# https://auth-test.berkeley.edu/cas/login?service=http%3A%2F%2Ftest.host%2Faccounts%2F
		assert_response :redirect
		assert_match "https://auth-test.berkeley.edu/cas/login", @response.redirected_to
	end

end
