module Authentication

	#	Much of the following code is from the restful_authentication plugin
	#	but has been modified by Jake and several others before
	#	being modified to more appropriately fit this situation.

protected

	def logged_in?
		current_user != :false
	end

	# Accesses the current user from the session.  Set it to :false if login fails
	# so that future calls do not hit the database.
	def current_user
#	Authentication will always be from CalNet and hence from session so basic_auth and cookie are unneeded
#		@current_user ||= (login_from_session || login_from_basic_auth || login_from_cookie || :false)
		@current_user ||= (login_from_session || :false)
	end

	# Inclusion hook to make #current_user and #logged_in?
	# available as ActionView helper methods.
	#	All other methods are only available in controller code.
	def self.included(base)
		base.send :helper_method, :current_user, :logged_in?
	end

######################################################################

	def current_user=(new_user)
#	May use this in the future, but doubt it
#		session[:user_id] = (new_user.nil? || new_user.is_a?(Symbol)) ? nil : new_user.id
		@current_user = new_user || :false
	end

	# Called from #current_user.
	def login_from_session
		self.current_user = User.find_create_and_update_by_uid(session[:calnetuid]) if session[:calnetuid]
	end

#	Not used yet, so not tested yet, so commented out.
#	def store_location
#		session[:return_to] = request.request_uri
#	end
	#	The problem with these two session variables is that there is one per app.
	#	A user like myself can open many tabs or windows.  It'd be nice if I
	#	could create sub sessions for each tab and window.  Just haven't done
	#	it yet.
#	Not used yet, so not tested yet, so commented out.
#	def store_referer
#		session[:refer_to] = request.env["HTTP_REFERER"]
#	end

#	Not used yet, so not tested yet, so commented out.
#	def redirect_back_or_default(default)
#		redirect_to(session[:return_to] || default)
#		session[:return_to] = nil
#	end

	def redirect_to_referer_or_default(default)
#		redirect_to(session[:refer_to] || default)
#	I don't quite know why the writer required that the developer set the :refer_to.
		redirect_to( session[:refer_to] || request.env["HTTP_REFERER"] || default )
		session[:refer_to] = nil
	end

	def access_denied( message="You don't have permission to complete that action.", default=root_path )
#		store_referer
		flash[:error] = message
		redirect_to_referer_or_default( default )
	end

	def admin_required
#	test
#		false or access_denied("Admin privileges required to access that page!")
		(logged_in? and current_user.is_admin?) or access_denied("Admin privileges required to access that page!")
	end

end
