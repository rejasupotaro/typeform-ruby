# Typeform

[Typeform I/O](http://typeform.io/) client for Ruby.

## Usage

### Initialize Client

```ruby
typeform_api_key = ENV['TYPEFORM_API_KEY']
client = Typeform::Client.new(typeform_api_key)
```

### Get API information

If you want to make sure your authentication and connection to Typeform I/O works, call `Typeform::Client#information`.

```ruby
client.information
```

The response contains information about the API. It is useful for testing or making sure you have access.

```json
{
  "name": "Typeform I/O Build API",
  "description": "Build API for creating forms awesomely",
  "version": "v0.4",
  "documentation": "https://docs.typeform.io/",
  "support": "support@typeform.io",
  "time": "2015-05-26 17:55:23 +0000"
}
```

### Create a typeform

Call `Typeform::Client#create_form_from_file` to create a new typeform.

```ruby
file = File.open("example/example.json")
client.create_form_from_file(file)
```

You have parameters to set the title, webhook URL and of course, the fields. The form endpoint will also return you a hash of URLs that you can use to distribute your typeform or delete it.

```json
{
  "id": "keEwsGeuC",
  "title": "My first typeform",
  "fields": [
    {
      "type": "short_text",
      "question": "What is your name?"
    }
  ],
  "links": [
    {
      "rel": "self",
      "href": "https://api.typeform.io/latest/forms/keEwsGeuC"
    },
    {
      "rel": "form_render",
      "href": "https://forms.typeform.io/to/keEwsGeuC"
    }
  ]
}
```

### Show typeform

You can get the structure back of a typeform. It's useful if you want to allow your users to edit their typeform or you just want to get the URL of the typeform by leveraging the links.rel['form_render'].href link.

```ruby
client.show_form(form_id)
```
