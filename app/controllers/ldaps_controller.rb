class LdapsController < ApplicationController

	def show
		@person = UCB::LDAP::Person.find_by_uid(current_user.uid)
	end

end
