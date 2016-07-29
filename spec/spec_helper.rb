require 'OState'

OState::Configuration.api_key = "7dc1ba922a424d88af580364c7b8bd05"

RSpec.configure do |config|

  config.expect_with :rspec do |expect|
    expect.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |mock|
    mock.syntax = :should
  end
end
