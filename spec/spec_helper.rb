require 'OState'
require 'vcr'

OState::Configuration.api_key = "7dc1ba922a424d88af580364c7b8bd05"

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|

  config.expect_with :rspec do |expect|
    expect.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |mock|
    mock.syntax = :should
  end
end
