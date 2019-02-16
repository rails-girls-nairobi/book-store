module Types
  class BookType < Types::BaseObject
    graphql_name 'BookType'
    description 'Fields required to create a book'

    field :id, ID, null: false
    field :title, String, null: false
    field :author, String, null: false
    field :description, String, null: false
  end
end