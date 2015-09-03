require 'spec_helper'

describe Typeform::Form do
  subject do
    choice1 = Typeform::Choice.new
    choice1.label = "Metro"
    choice2 = Typeform::Choice.new
    choice2.label = "Car"

    field1 = Typeform::Field.new
    field1.type = "multiple_choice"
    field1.question = "How do you normally get to work?"
    field1.description = "On most days..."
    field1.required = "false"
    field1.choices = [choice1, choice2]

    form = Typeform::Form.new
    form.title = "title"
    form.fields = [field1]
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
            type: "multiple_choice",
            question: "How do you normally get to work?",
            description: "On most days...",
            required: "false",
            choices: [{label: "Metro"}, {label: "Car"}]
          }
        ],
        design_id: "design_id",
        webhook_submit_url: "webhook_submit_url"
      )
    end
  end
end
