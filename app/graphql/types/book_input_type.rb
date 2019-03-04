module Types
  class BookInputType < Types::BaseInputObject
    graphql_name 'BookInputType'
    description 'Fields required to create a book'

    argument :title, String, required: true
    argument :description, String, required: true
    argument :author, String, required: true
  end
end
