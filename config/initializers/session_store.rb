# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_linotype_session',
  :secret      => 'daf362fd6fa7a10aa0835cde5403ee7609cf6bcfba087cf23f37c95d1ef8d08046ba7a31fccc87a9241dcedad3cefc75fe13cab4a56e060a2f670bcac619b54d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
