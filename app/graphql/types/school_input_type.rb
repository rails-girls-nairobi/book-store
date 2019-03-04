module Types
  class SchoolInputType < Types::BaseInputObject
    graphql_name 'SchoolInputType'
    description 'Fields for creating a school'

    argument :name, String, required: true
    argument :location, String, required: true
  end
end
