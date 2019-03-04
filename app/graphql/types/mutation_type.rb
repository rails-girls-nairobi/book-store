module Types
  class MutationType < Types::BaseObject
    graphql_name 'Mutation'
    description 'Root mutation'

    field :createBook, mutation: Mutations::CreateBook
    field :createSchool, mutation: Mutations::CreateSchool
  end
end
