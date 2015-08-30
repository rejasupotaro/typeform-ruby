require 'spec_helper'

describe Typeform::Field do
  subject do
    field = Typeform::Field.new
    field.type = "type"
    field.question = "question"
    field.description = "description"
    field.required = false
    field.choices = [{key: "value"}]
    field.to_json
  end

  describe "#to_json" do
    it "returns an Object in JSON format" do
      should be_json_as(
        type: "type",
        question: "question",
        description: "description",
        required: false,
        choices: [{key: "value"}]
      )
    end
  end
end
