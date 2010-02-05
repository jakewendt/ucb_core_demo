# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	# Settings in config/environments/* take precedence over those specified here.
	# Application configuration should go into files in config/initializers
	# -- all .rb files in that directory are automatically loaded.

	# Add additional load paths for your own custom dirs
	# config.load_paths += %W( #{RAILS_ROOT}/extras )

	# Specify gems that this application depends on and have them installed with rake gems:install
	# config.gem "bj"
	# config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
	# config.gem "sqlite3-ruby", :lib => "sqlite3"
	# config.gem "aws-s3", :lib => "aws/s3"


	#	For CAS / CalNet Authentication
	config.gem "rubycas-client"

	#	probably will come from http://gemcutter.org/gems/ucb_ldap
	#	version 1.3.2 as of Jan 25, 2010
	config.gem "ucb_ldap", :source => "http://gemcutter.org"


#	mocha is used in the tests and therefore required
#	however if it is listed here, the tests fail.
#	so make sure it is installed and commented out here.
#		wtf?
#	config.gem "mocha"

#	Also, factory girl is used in the test but not
#	really needed here for the dev or pro environments.
#	config.gem "thoughtbot-factory_girl",
#		:lib    => "factory_girl",
#		:source => "http://gems.github.com"

#	And autotest is not working

#	Successfully installed json_pure-1.2.0
#	Successfully installed rubyforge-2.0.3
#	Successfully installed rake-0.8.7
#	Successfully installed gemcutter-0.3.0
#	Successfully installed hoe-2.5.0
#	Successfully installed ZenTest-3.10.0
	#	for some reason, on my new Mac Pro, newer versions of 
	#	ZenTest's autotest don't actually find the rails test files.
	#	Also, autotest's testing works, but rake test finds some 
	#	odd errors that didn't exist on my other computer.
#	config.gem "ZenTest", :version => '3.10.0'	
#	config.gem "ZenTest", :version => '3.11.0'
#	config.gem "ZenTest", :version => '4.1.1'
	#	Versions newer than 4.1.1 remove autotest



	# Only load the plugins named here, in the order given (default is alphabetical).
	# :all can be used as a placeholder for all plugins not explicitly named
	# config.plugins = [ :exception_notification, :ssl_requirement, :all ]

	# Skip frameworks you're not going to use. To use Rails without a database,
	# you must remove the Active Record framework.
	# config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

	# Activate observers that should always be running
	# config.active_record.observers = :cacher, :garbage_collector, :forum_observer

	# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
	# Run "rake -D time" for a list of tasks for finding time zone names.
	config.time_zone = 'UTC'

	# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
	# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
	# config.i18n.default_locale = :de
end
