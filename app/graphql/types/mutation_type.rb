module Types
  class MutationType < Types::BaseObject
    field :create_book, Types::BookType, mutation: Mutations::CreateBook
    field :create_school, Types::SchoolType, mutation: Mutations::CreateSchool
  end
end
