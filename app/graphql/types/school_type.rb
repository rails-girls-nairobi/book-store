module Types
  class SchoolType < Types::BaseObject
    graphql_name 'SchoolType'
    description 'Fields required to create or update a school'

    implements GraphQL::Relay::Node.interface

    global_id_field :id

    field :id, ID, null: false
    field :name, String, null: false
    field :location, String, null: false
  end
end
