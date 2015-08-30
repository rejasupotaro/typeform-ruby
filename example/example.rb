$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "typeform"
require "pry"

typeform_api_key = ENV['TYPEFORM_API_KEY']
client = Typeform::Client.new(typeform_api_key)

# information
# pp client.information

# show form
# pp client.show_form("tPvxO8qyP6gIzg")

# create_form_from_json
field = Typeform::Field.new
field.type = "short_text"
field.question = "What is your name?"
form = Typeform::Form.new
form.title = "title"
form.fields = [field]
# pp client.create_form_from_json(form.as_json)

# create_form_from_file
file = File.open("example/example.json")
# pp client.create_form_from_file(file)
