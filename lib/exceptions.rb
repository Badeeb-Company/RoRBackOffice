module Exceptions

  # Custom error class for rescuing from all errors till now
  class Error < StandardError
    attr_accessor :message
    def initialize(message="")
      @message = message
    end
  end

  # Raised when ...
  # class CustomError < Error; end

end
