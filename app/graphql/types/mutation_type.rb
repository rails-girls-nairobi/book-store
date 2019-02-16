module Types
  class MutationType < Types::BaseObject
    field :create_book, Types::BookType, mutation: Mutations::CreateBook
  end
end
