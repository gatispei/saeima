# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_saeima_session',
  :secret      => 'dfcec98c74494ee7685b90fc7fa6861ccd13e52155d355a9900bcac4155c7a2ea8d3e2418b6656a95048219a10f3cf0cf8cb650b42e22e56f721d7a0c8960671'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
