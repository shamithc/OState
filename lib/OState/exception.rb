module OState
  class OStateError < ::StandardError; end
  class AuthenticationError < OStateError; end
  class NotFoundError < OStateError; end
  class BadRequestError < OStateError; end
  
end
