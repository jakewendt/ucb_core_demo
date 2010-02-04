namespace :app do

	task :args_as_array do
		args = $*.dup.slice(1..-1)
		puts args.collect {|arg| "X:" << arg }.join("\n")
		exit
	end

	desc "Deputize user by UID"
	task :deputize => :environment do
		puts
		if ENV['uid'].blank?
			puts "User's CalNet UID required."
			puts "Usage: rake #{$*} uid=INTEGER"
			puts
			exit
		end
		if !User.exists?(:uid => ENV['uid'])
			puts "No user found with uid=#{ENV['uid']}."
			puts
			exit
		end
		user = User.find(:first, :conditions => { :uid => ENV['uid'] })
		puts "Found user #{user.displayname}.  Deputizing..."
		user.deputize
		puts "User deputized: #{user.is_admin?}"
		puts
#puts $*.last
#exit
	end

end


#	$* is an array of arguments passed to rake
#	all of them are tasks unless they include a = sign
#	so can't do it like I was trying ...
#		rake app:deputize 1
#	must be ...
#		rake app:deputize uid=1
#
#	if I put an explicit 'exit' at the end of the task, rake doesn't try to execute any more
#
#	puts $*.length
#		if $*.length <= 1
#			puts "User's CalNet UID required."
#			puts "Usage: rake #{$*} INTEGER"
#			exit
#		end


