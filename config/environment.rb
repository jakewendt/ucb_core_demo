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


#	For MS SQL Server ...
#	from http://gist.github.com/170286
	# This gem may be needed, but the database.yml cannot be modified to use it
	#	until it is (or will need to be installed manually via ruby and gem.)
	# If the database.yml refers the sqlserver db, it will prevent the gem from being able
	# to be installed via rails' rake gems:install
		#	these version may not be important
#		config.gem 'dbi', :version => '0.4.1'
#		config.gem 'dbd-odbc', :version => '0.2.4', :lib => 'dbd/ODBC'
	#	dbd-odbc gem requires ...
	#		mkdir tmp
	#		cd tmp
	#		curl -O http://www.ch-werner.de/rubyodbc/ruby-odbc-0.9997.tar.gz
	#		tar -zxvf ruby-odbc-0.9997.tar.gz
	#		cd ruby-odbc-0.9997
	#		ruby extconf.rb
	#		make
	#		sudo make install
#		config.gem 'activerecord-sqlserver-adapter', :lib => 'active_record/connection_adapters/sqlserver_adapter'
#		config.gem 'activerecord-odbc-adapter', :lib => 'active_record/connection_adapters/odbc_adapter'

#	For CAS / CalNet Authentication
	config.gem "rubycas-client"


	#	probably will come from http://gemcutter.org/gems/ucb_ldap
	#	version 1.3.2 as of Jan 25, 2010
	config.gem "ucb_ldap", :source => "http://gemcutter.org/gems/"


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
