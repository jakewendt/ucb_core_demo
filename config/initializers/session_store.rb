# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_calnet_session',
  :secret      => 'f10952affe684a8658d252bd4f64390ab938e647b35c5e82d42eafc5f1f0270f3318112332356c6524d6ccad6ebf653b1722bc1ca30660e9fc6e93a85121f825'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
