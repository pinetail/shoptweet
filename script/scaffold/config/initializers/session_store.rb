# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scaffold_session',
  :secret      => '5aeec88db5a2cd1fec4c6f480de8a1e285ced58f7b765e079cec373b1e9918dea17fe8ef427300c915ab7f43195d076f4d2d78143757f6392352daa416e99b16'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
