VCR.config do |c|
  c.cassette_library_dir  = Rails.root.join("spec", "vcr")
  c.stub_with :webmock
  config.configure_rspec_metadata!
  config.ignore_localhost = true
  config.default_cassette_options = { record: :new_episodes }
end
