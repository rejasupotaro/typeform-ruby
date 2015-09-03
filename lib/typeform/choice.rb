module Typeform
  class Choice
    include JSON::Encodable

    property :label, type: String

    attr_accessor :label

    def label
      @label
    end
  end
end
