require 'spec_helper'

describe Typeform::Form do
  subject do
    field = Typeform::Field.new
    field.type = "type"
    field.question = "question"
    field.description = "description"
    field.required = "false"
    field.choices = [{key: "value"}]

    form = Typeform::Form.new
    form.title = "title"
    form.fields = [field]
    form.design_id = "design_id"
    form.webhook_submit_url = "webhook_submit_url"

    form.to_json
  end

  describe "#to_json" do
    it "returns an Object in JSON format" do
      should be_json_as(
        title: "title",
        fields: [
          {
            type: "type",
            question: "question",
            description: "description",
            required: "false",
            choices: [{key: "value"}]
          }
        ],
        design_id: "design_id",
        webhook_submit_url: "webhook_submit_url"
      )
    end
  end
end
