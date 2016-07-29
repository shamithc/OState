module OState
  class OStateError < ::StandardError; end
  class AuthenticationError < OStateError; end
end
