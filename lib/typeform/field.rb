module Typeform
  class Field
    include JSON::Encodable

    property :type, type: String
    property :question, type: String
    property :description, type: String
    property :required
    property :choices

    attr_accessor :type, :question, :description, :required, :choices

    # This value could take...
    # short_text:      The ShortText Field is the typical, standard text input that you would expect.
    # long_text:       You would use a LongTextField if you want your user to leave answers with freely written text, longer than one line.
    # multiple_choice: The MultipleChoiceField is used for (guess), displaying multiple choice text based answers.
    # picture_choice:  The PictureChoiceField is much like the MultipleChoiceField but you can also use images as choices and make your typeforms beautiful and engaging.
    # statement:       The statement field is not a question, it's just a opportunity to make conversation in your typeform.
    # dropdown:        The DropdownField is a cross between select element auto-completion. Use it when you need your respondent to choose from a long list of choices.
    # yes_no:          The YesNo Field is a field that allows the user to answer only yes or no to a question
    # number:          The NumberField is like a ShortTextField that only allows numbers.
    # raiting:         RatingField is the best field to use if you want your users to rate anything in a visual way.
    # opinion_scale:   OpinionScale field is the perfect field if you want to do a NPS style evaluation or simply ask your respondents to review a product of yours, with a scale you can set yourself.
    # email:           You want your users to give you their precious email? Then the EmailField is just the right field for you!
    # website:         The WebsiteField is the field you would use if you want to collect a URL from your respondent. It will validate that the answer contains a URL.
    # legal:           The LegalField is very similar to the YesNoField, with some minor UI differences including a smaller body text.
    def type
      @type
    end

    def question
      @question
    end

    def description
      @description
    end

    def required
      @required
    end

    def choices
      @choices
    end
  end
end
