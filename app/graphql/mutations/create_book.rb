module Mutations
  class CreateBook < Mutations::BaseObject
    graphql_name 'CreateBook'
    description 'Create book'

    argument :title, String, required: true
    argument :author, String, required: true
    argument :description, String, required: true

    def resolve(title:, author:, description:)
      Book.create(
        title: title,
        author: author,
        description: description
      )
    end
  end
end
