module Types
  class SchoolType < Types::BaseObject
    description 'School Type'

    field :id, ID, null: false
    field :name, String, null: false
  end
end