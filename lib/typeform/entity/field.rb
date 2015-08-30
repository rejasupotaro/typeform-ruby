module Typeform
  class Field
    include JSON::Encodable

    property :type, type: String
    property :question, type: String

    attr_accessor :type, :question

    def initialize
      @type = "short_text"
      @question = "What is your name?"
    end

    def type
      @type
    end

    def question
      @type
    end
  end
end
