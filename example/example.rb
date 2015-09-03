$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "typeform"
require "pry"

typeform_api_key = ENV['TYPEFORM_API_KEY']
client = Typeform::Client.new(typeform_api_key)

# information
# pp client.information.body

# show form
# pp client.show_form("tPvxO8qyP6gIzg")

# create_form_from_json
choice1 = Typeform::Choice.new
choice1.label = "Metro"
choice2 = Typeform::Choice.new
choice2.label = "Car"

field1 = Typeform::Field.new
field1.type = "multiple_choice"
field1.question = "How do you normally get to work?"
field1.description = "On most days..."
field1.required = false
field1.choices = [choice1, choice2]

form = Typeform::Form.new
form.title = "title"
form.fields = [field1]
form.webhook_submit_url = "http://webhook_submit_url.com"

pp form.as_json

pp client.create_form_from_json(form.as_json).body

# create_form_from_file
# file = File.open("example/example.json")
# pp client.create_form_from_file(file)
